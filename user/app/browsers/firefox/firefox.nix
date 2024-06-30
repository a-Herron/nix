{pkgs, ...}:

{
  home.packages = [ pkgs.firefox ];

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
	name = "default";
	isDefault = true;
	settings = {
	  "browser.startup.homepage" = "https://github.com/notifications";
	};
      };
    };
  };


}
