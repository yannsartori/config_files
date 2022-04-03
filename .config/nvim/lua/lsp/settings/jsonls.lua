local schemas = {
	{
		description = "TypeScript compiler configuration file",
		fileMatch = {
			"tsconfig.json",
			"tsconfig.*.json",
		},
		url = "http://json.schemastore.org/tsconfig.json",
	},
	{
		description = "Angular JSON",
		fileMatch = {
			"angular.json",
			"angular.*.json",
		},
		url = "http://raw.githubusercontent.com/angular/angular-cli/master/packages/angular/cli/lib/config/workspace-schema.json",
	},
	{
		description = "Angular CLI JSON",
		fileMatch = {
			".angular-cli.json",
			".angular-cli.*.json",
		},
		url = "http://raw.githubusercontent.com/angular/angular-cli/v10.1.6/packages/angular/cli/lib/config/schema.json",
	},
	{
		description = "ESLint config",
		fileMatch = {
			".eslintrc.json",
			".eslintrc",
		},
		url = "http://json.schemastore.org/eslintrc.json",
	},
	{
		description = "Gitlab CI",
		fileMatch = {
			".gitlab-ci.yml",
		},
		url = "http://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json",
	},
	{
		description = "Prettier config",
		fileMatch = {
			".prettierrc",
			".prettierrc.json",
			"prettier.config.json",
		},
		url = "http://json.schemastore.org/prettierrc",
	},
	{
		description = "Json schema for properties json file for a GitHub Workflow template",
		fileMatch = {
			".github/workflow-templates/**.properties.json",
		},
		url = "http://json.schemastore.org/github-workflow-template-properties.json",
	},
	{
		description = "Packer template JSON configuration",
		fileMatch = {
			"packer.json",
		},
		url = "http://json.schemastore.org/packer.json",
	},
	{
		description = "NPM configuration file",
		fileMatch = {
			"package.json",
		},
		url = "http://json.schemastore.org/package.json",
	},
	{
		description = "JSON schema for Visual Studio component configuration files",
		fileMatch = {
			"*.vsconfig",
		},
		url = "http://json.schemastore.org/vsconfig.json",
	},
}

local opts = {
	settings = {
		json = {
			schemas = schemas,
		},
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
}

return opts
