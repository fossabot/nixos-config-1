self: super:

{
  # Custom packages
  instant-markdown-d = (super.callPackage ./instant-markdown-d/default.nix {}).package;
  gtop =  (super.callPackage ./gtop/default.nix {}).package;
  vimPluginsLeo = super.callPackage ./vim/customPlugins.nix {};
  leovim = super.callPackage ./vim/leovim.nix {};
  leoVim = super.callPackage ./vim/leoVim.nix {};
  #bobthefish = super.callPackage ./bobfish/default.nix {};
}
