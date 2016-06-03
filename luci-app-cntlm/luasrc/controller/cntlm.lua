-- Copyright 2016 Jakub Skopal <j@kubs.cz>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.cntlm", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/cntlm") then
		return
	end

	local page = entry({"admin", "services", "cntlm"}, cbi("cntlm"), _("cntlm"))
	page.dependent = true

end
