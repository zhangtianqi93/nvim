local m = {}

local installer = require("nvim-lsp-installer")

local servers = {
    -- sumneko_lua = require("user.lsp.config.lua"),
    jsonls = require("user.lsp.config.json"),
}

m.config = function()
    for name, _ in pairs(servers) do
        local ok, server = installer.get_server(name)

        if ok then
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end
        end
    end

    installer.on_server_ready(function(server)
        local config = servers[server.name]

        if config == nil then
            return
        end

        if config.on_setup then
            config.on_setup(server)
        else
            server:setup({})
        end
    end)
end

return m
