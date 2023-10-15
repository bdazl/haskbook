module Main (main) where
import Control.Monad
import Options.Applicative
import Chapter4
import Chapter5

-- data Options = Options{ optCommand :: Command }
-- data Command = Chap5 | Default
--

chap4 :: ParserInfo (IO ())
chap4 = info (pure chapter4) idm

chap5 :: ParserInfo (IO ())
chap5 = info (pure chapter5) idm

opts :: Parser (IO ())
opts = subparser
    ( command "4" chap4
   <> command "5" chap5
   <> command "latest" chap4
    )

main :: IO ()
main = join $ execParser (info opts idm)
