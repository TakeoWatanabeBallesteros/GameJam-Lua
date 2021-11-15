--super simple yarn parser.
--it's up to you to actually parse commands
--or do something with tags, etc. This just allows you
--to load, etc, nodes from a yarn exported to json.
Yarnparse = Object:extend()

function string:split(delimiter)
    local result = { }
    local from  = 1
    local delim_from, delim_to = string.find( self, delimiter, from  )
    while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from  = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from  )
    end
    table.insert( result, string.sub( self, from  ) )
    return result
end

function string:extract(open, close)
    local c=self:split(open)
    local b=c[2]
    if(b==nil) then return nil end
    b=b:split(close)
    return b[1]
end

Yarnparse.load=function(self, filename)  
    local yarn={}
    local parsed, size=love.filesystem.read("string", filename)
    local hashmap={}
    local nodes= JSON.decode(parsed)
    --now to create a loopup table, for faster loading by title
    for i,v in ipairs(nodes) do
        hashmap[v.title]=i
    end

    return {
        file=filename,
        nodes=nodes,
        hashmap=hashmap,
        exposed={},


        --this checks for [[ ]] and gets what is between them
        --this can be used for parsing any bbcodes, but for now
        --it's just being used as an improved version of get_choices.
        get_parse_strings=function(self, prefix, text, postfix)
            local s=text:extract(prefix, postfix)
            --local s=text:extract("%[%[", "%]%]")
            if(s==nil) then return {found=false} end
            local func=s:split(":") --action name
            return{
                found=true,
                action=string.gsub(func[1]:lower(), "%s+", ""), --removes any whitespace, and lower cases it.
                arguments=func[2]
            }
        end,

        --improved version. Now it dynamically does what you think it should do...lol
        get_choices=function(self, text)
            local lines=text:split('\n')
            local c=""
            local choices={}
            for i, v in ipairs(lines) do
                local parser=self:get_parse_strings("%[%[", v, "%]%]")
                if(not parser.found) then
                    c=c .. v .. '\n'
                else
                    if(parser.action=="answer") then
                        local nxt=parser.arguments:split("|")
                        if(nxt[1]==' ') or (nxt[1]=='') then 
                            --if no split text, use  the node title as the answer text.
                            choices[#choices+1]={text=nxt[2], node=nxt[2]}
                        else
                            --splits it so there's the text for the choice, and the node it links to.
                            choices[#choices+1]={text=nxt[1], node=nxt[2]}
                        end                 
                    end
                end
            end
            return c, choices
        end,


            --parse body function
            remove_blanks=function(self, lines)
                --remove any blank lines.
                local buffer={}
                for i,v in ipairs(lines) do
                    if(string.len(v)>0) then
                        buffer[#buffer+1]=v
                    end
                end
                return buffer
            end,
            
            expose_function=function(self, key, expose)
                self.exposed[key]=expose
            end,

            parse_body=function(self, text)
                local lines=text:split('\n')
                lines=self:remove_blanks(lines)
                return {
                     text=text,
                     lines=lines,
                     at=0,
                     total=#lines,
                     who=function(self)
                        if(self.at>self.total) then return nil end
                        local text=self.lines[self.at]
                        if string.match(text, ": ") then
                            local buff=text:split(": ")
                            return {who=buff[1], text=self:text_spliter(buff[2])}
                        end
                        return {who="player_1", text=self:text_spliter(text)}
                     end,
                     get_parse_strings=function(self, prefix, text, postfix)
                        local s=text:extract(prefix, postfix)
                        --local s=text:extract("%[%[", "%]%]")
                        if(s==nil) then return {found=false} end
                        local func=s:split(":") --action name
                        return{
                            found=true,
                            action=string.gsub(func[1]:lower(), "%s+", ""), --removes any whitespace, and lower cases it.
                            arguments=func[2]
                        }
                    end,
                     traverse=function(self)
                        self.at=self.at+1
                        if(self.at>self.total) then return nil end
                        local ret=self.lines[self.at]
                        --check to see if it's a command, if so, do that.
                            if string.match(ret, "<<") then
                                  local p=self:get_parse_strings("<<", ret, ">>")
                                  if(p.action=="lua" or p.action=="print") then
                                    local f=loadstring(p.arguments)
                                    f()
                                  elseif p.action=="scene" then
                                    Main_FSM:changeState(p.arguments)
                                  elseif p.action=="background" then
                                    DIALOG_BACKGROUND = DIALOGUES_BACKGROUNDS[p.arguments]
                                  else
                                    if(self.exposed[p.action]) then
                                        self.exposed[p.action](p.arguments)
                                    else
                                        error("Yarn attempted to call " .. p.action .. " but this is not a script call. Please check your spelling, and try again")
                                    end
                                 end
                                return self.lines[self.at], true
                            end
                        return self:who(ret), false
                     end,
                     text_spliter=function(self, text) --Split the text in words and select the color and if will shake
                        local t = {}
                        repeat
                            local c, p
                            if string.match(text, "%[color=") and not string.match(text:split("%[color")[1], "%[shake") then
                                c=text:extract("%[color=", "%]")
                                p=text:extract("%[color=%#%w%w%w%w%w%w%]", "%[%/color%]")
                                if #t == 0 then
                                    local w = text:split("%[color=")[1]
                                    w = w:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {{0, 0, 0}, v..' ', false})
                                    end
                                end
                                text=text:split("%[%/color%]")[2]
                                if string.match(p, "%[shake") then
                                    p=p:extract("%[shake%]", "%[%/shake%]")
                                    local w = p:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {self:hex2rgb(c), v..' ', true})
                                    end
                                else
                                    local w = p:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {self:hex2rgb(c), v..' ', false})
                                    end
                                end
                            elseif string.match(text, "%[shake") then
                                p=text:extract("%[shake%]", "%[%/shake%]")
                                if #t == 0 then
                                    local w = text:split("%[shake%]")[1]
                                    w = w:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {{0, 0, 0}, v..' ', false})
                                    end
                                end
                                text=text:split("%[%/shake%]")[2]
                                if string.match(p, "%[color=") then
                                    c=p:extract("%[color=", "%]")
                                    p=p:extract("%[color=%#%w%w%w%w%w%w%]", "%[%/color%]")
                                    local w = p:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {self:hex2rgb(c), v..' ', true})
                                    end
                                else
                                    local w = p:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {{0, 0, 0}, v..' ', true})
                                    end
                                end
                            else
                                local w = text:split(" ")
                                    for k,v in ipairs(w) do
                                        table.insert(t, {{0, 0, 0}, v..' ', false}) 
                                    end
                                break
                            end
                        until not text
                        return t
                     end,
                     hex2rgb=function(self,_hex)
                        local hex = string.gsub(_hex,"%#","")
                        if hex:len() == 3 then
                          return {(tonumber("0x"..hex:sub(1,1))*17)/255, (tonumber("0x"..hex:sub(2,2))*17)/255, (tonumber("0x"..hex:sub(3,3))*17)/255}
                        else
                          return {tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255}
                        end
                     end,
                     done=function(self)
                        if(self.at>=self.total) then return true else return false end
                     end
                }
            end,

            get_node=function(self, node)
                --if it's not a node id, use the lookup table
                if(type(node)~="number") then
                    --error if title does not exist in lookup table.
                    if(self.hashmap[node]==nil) then error("Node " .. node .. " does not exist in " .. self.file  .. ".  Please check spelling.") end
                    --if all is kosher, use that lookup table
                    node=self.hashmap[node]
                end
            
                --load the node through the ID
                local v=self.nodes[node]
            
                --grab the body, and any choices it has
                local body, choices=self:get_choices(v.body)
                local has_choices=false
                if(#choices>0) then has_choices=true end
                
                return {
                        --this just returns a list containing all the info from
                        --a node. 
                        id=node,
                        title=v.title,
                        tags=v.tags:split(", "),
                        body=self:parse_body(body),
                        choices=choices,
                        has_choices=has_choices,
                        colorId=v.colorId
                    }
            end,
            --make a choice function
            make_choice=function(self, node, choice)
                return self:get_node(node.choices[choice].node)
            end
    }
end
return Yarnparse