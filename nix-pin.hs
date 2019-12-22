#! /usr/bin/env nix-shell
#! nix-shell -i runghc -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [ text turtle ])"

{-# LANGUAGE OverloadedStrings #-}


{-|
  This tool has a single purpose: to pin the current Nix channel.
  Right now, it doesn't have a way to find the current channel, so it just defaults to `nixos-19.09`.
-}
import qualified Data.Text as Text
import qualified Data.Text.IO as T
import Turtle hiding (text)

main :: IO ()
main = 
  createChannelPin "nixos-19.09"

createChannelPin :: Text -> IO ()
createChannelPin channel = do
  output "nixpkgs-pin.json" $ inproc command args empty
  where
    command = "nix-prefetch-git"
    args = ["https://github.com/nixos/nixpkgs-channels.git", "refs/heads/" <> channel]
