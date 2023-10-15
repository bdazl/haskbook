module Main (main) where
import Control.Monad
import Options.Applicative
import Chapter5

-- data Options = Options{ optCommand :: Command }
-- data Command = Chap5 | Default
--

chap5 :: ParserInfo (IO ())
chap5 = info (pure chapter5) idm

opts :: Parser (IO ())
opts = subparser
    ( command "5" chap5
   <> command "latest" chap5
    )

main :: IO ()
main = join $ execParser (info opts idm)
