{ inputs, ... }: {
  
	imports = [inputs.nixvim.homeModules.nixvim];

	programs.nixvim = {
		enable = true;
		extraConfigLua = ''
			vim.opt.number = true
			vim.opt.relativenumber = true
			vim.cmd([[syntax on]])
			vim.cmd([[filetype plugin indent on]])
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function() vim.opt_local.spell = true end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function() vim.opt_local.spell = true end,
			})
		'';
		#colorschemes.catppuccin.enable = true;
		#plugins.lualine.enable = true;
	};
}
