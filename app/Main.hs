module Main where

-- import Paths_nn ( version )
import Data.Version ( showVersion )
import Options.Applicative ( Parser
                           , (<**>)
                           , (<|>)
                           , command
                           , execParser
                           , header
                           , helper
                           , info
                           , flag'
                           , fullDesc
                           , long
                           , progDesc
                           , short
                           )

data Options = PrintVersionOptions ()
             | CommandOptions Command
             | InteractiveOptions ()

data Command = Context ()

options :: Parser Options
options = printVersionOptions <|> commandOptions <|> interactiveOptions

printVersionOptions :: Parser Options
printVersionOptions = PrintVersionOptions
    <$> flag' () (long "version" <> short 'v')

commandOptions :: Parser Options
commandOptions = subparser
    ( command "context" (info contextCommand (progDesc "Handle next context"))
    )

contextCommand :: IO ()
contextCommand 

interactiveOptions :: Parser Options
interactiveOptions = InteractiveOptions

main :: IO ()
main = runApp' =<< execParser opts
  where
    opts = info (options <**> helper)
        ( fullDesc
       <> progDesc ""
       <> header "next"
        )

    runApp' = putStrLn . show
