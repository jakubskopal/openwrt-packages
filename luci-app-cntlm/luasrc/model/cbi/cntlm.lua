-- Copyright 2016 Jakub Skopal <j@kubs.cz>
-- Licensed to the public under the Apache License 2.0.

m = Map("cntlm", "cntlm", translate("Cntlm is an NTLM / NTLMv2 authenticating HTTP/1.1 proxy."))

s = m:section(TypedSection, "cntlm", "")
s.addremove = true
s.anonymous = false

-- Process-related configuration values

enable=s:option(Flag, "disabled", translate("Enabled"))
enable.enabled="0"
enable.disabled="1"
enable.default = "1"
enable.rmempty = false

respawn=s:option(Flag, "respawn", translate("Respawn"))
respawn.default = false
respawn.rmempty = false

-- Upstream and most commonly used options

bind=s:option(Value, "bind", translate("Bind interface"))
bind.rmempty = true
bind.datatype = "ip4addr"

listen_port=s:option(Value, "listen_port", translate("Listen port"))
listen_port.default = "3128"
listen_port.rmempty = false
listen_port.datatype = "port"

socks5_port=s:option(Value, "socks5_port", translate("Socks5 port"))
socks5_port.rmempty = true
socks5_port.datatype = "port"

workstation=s:option(Value, "workstation", translate("Workstation name"))
workstation.default = "netbios1"
workstation.rmempty = false

domain=s:option(Value, "domain", translate("Upstream Proxy Login Domain"))
domain.rmempty = false

username=s:option(Value, "username", translate("Upstream Proxy Username"))
username.rmempty = false

password=s:option(Value, "password", translate("Upstream Proxy Password"))
password.rmempty = false
password.password = true

noproxy=s:option(Value, "noproxy", translate("No proxy for"))
noproxy.default = "localhost, 127.0.0.*, 10.*, 192.168.*"
noproxy.rmempty = false

-- Other useful options

gateway=s:option(Flag, "gateway", translate("Bind to loopback interface only"))
gateway.enabled = "0"
gateway.disabled = "1"
gateway.default = "0"
gateway.rmempty = false

-- Options that should not be mangled with due to security or other reasons

auth=s:option(ListValue, "auth", translate("Authentication type"))
auth:value("NTLMv2", "NTLMv2")
auth:value("NTLM2SR", "NTLM2SR")
auth:value("NT", "NT")
auth:value("NTLM", "NTLM")
auth:value("LM", "LM")
auth.default = "NTLMv2"
auth.rmempty = true

ntlm_to_basic=s:option(Flag, "ntlm_to_basic", translate("NTML to Basic translation"))
ntlm_to_basic.default = false
ntlm_to_basic.rmempty = true

return m
