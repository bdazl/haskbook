module Main (main) where
import Control.Monad
import Options.Applicative
import Chapter5

-- data Options = Options{ optCommand :: Command }
-- data Command = Chap5 | Default

opts :: Parser (IO ())
opts = subparser
    ( command "5" (info (pure chapter5) idm)
   <> command "dummy" (info (pure dummy) idm)
    )

dummy :: IO ()
dummy = putStrLn "I'm dummy"

main :: IO ()
main = join $ execParser (info opts idm)
