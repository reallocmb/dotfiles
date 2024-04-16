function foo()
    vim.cmd('vnew | terminal')

    -- Warten, bis das Terminal geöffnet ist
    vim.cmd('wincmd l')

    -- Befehl `sh build.sh` im Terminal ausführen
    vim.fn.termopen('sh build.sh')
end
