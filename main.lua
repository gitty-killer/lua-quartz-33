-- TextStats CLI

if #arg < 1 then
  io.stderr:write("usage: lua main.lua <path> [--top N]\n")
  os.exit(1)
end

local top = 10
local path = nil
local i = 1
while i <= #arg do
  if arg[i] == "--top" and i + 1 <= #arg then
    top = tonumber(arg[i + 1]) or 10
    i = i + 2
  elseif not path then
    path = arg[i]
    i = i + 1
  else
    i = i + 1
  end
end

local f = assert(io.open(path, "r"))
local text = f:read("*a")
f:close()

local lines = 0
if #text > 0 then
  lines = 1
  for _ in text:gmatch("\n") do lines = lines + 1 end
end

local counts = {}
local words = 0
for w in text:lower():gmatch("%w+") do
  counts[w] = (counts[w] or 0) + 1
  words = words + 1
end

local list = {}
for w, c in pairs(counts) do
  table.insert(list, {w = w, c = c})
end

table.sort(list, function(a, b)
  if a.c == b.c then return a.w < b.w end
  return a.c > b.c
end)

print("lines: " .. lines)
print("words: " .. words)
print("chars: " .. #text)
print("top words:")
for j = 1, math.min(top, #list) do
  print("  " .. list[j].w .. ": " .. list[j].c)
end
