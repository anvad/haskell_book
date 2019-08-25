module Sing where


fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing songNumber = if (songNumber == defaultSongNumber) then fstString x else sndString y where
    defaultSongNumber = 1
    x = "Singin"
    -- original x = "Somewhere"
    y = "Somewhere"
