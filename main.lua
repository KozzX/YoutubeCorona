local videoID = "CiPuo5fIuZ0" --         <-------- AQUI VOCÊ BOTARÁ O CÓDIGO DO VÍDEO 

local path = system.pathForFile( "youtube.html", system.TemporaryDirectory )
     
local fh, errStr = io.open( path, "w" )
     
if fh then
    print( "Created file" )
    fh:write("<!doctype html>\n<html>\n<head>\n<meta charset=\"utf-8\">")
    fh:write("<meta name=\"viewport\" content=\"width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;\"/>\n")
    fh:write("<style type=\"text/css\">\n html { -webkit-text-size-adjust: none; font-family: HelveticaNeue-Light, Helvetica, Droid-Sans, Arial, san-serif; font-size: 1.0em; } h1 {font-size:1.25em;} p {font-size:0.9em; } </style>")
    fh:write("</head>\n<body>\n")
                    
    local height = math.floor(display.contentWidth / 16 * 12)
    fh:write([[<iframe width="100%" height="]] .. height .. [[" src="http://www.youtube.com/embed/]] .. videoID .. [[?html5=1" frameborder="0" allowfullscreen></iframe>]])
            
           
    fh:write( "\n</body>\n</html>\n" )
    io.close( fh )
else
    print( "Create file failed!" )
end

local function webListener(event)
    return true
end
               
local webView = native.newWebView(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
webView:request("youtube.html", system.TemporaryDirectory)
webView:addEventListener( "urlRequest", webListener )






