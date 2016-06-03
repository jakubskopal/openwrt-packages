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

proxy=s:option(DynamicList, "proxy", translate("Upstream Proxies"), translate("e.g. 10.20.30.40:3128 or 192.168.34.23:8080"))
proxy.cast = "table"
proxy.default = "10.23.43.129:3128"
proxy.rmempty = false

domain=s:option(Value, "domain", translate("Upstream Proxy Login Domain"))
domain.rmempty = false

username=s:option(Value, "username", translate("Upstream Proxy Username"))
username.rmempty = false

password=s:option(Value, "password", translate("Upstream Proxy Password"))
password.rmempty = false
password.password = true

noproxy=s:option(Value, "noproxy", translate("No proxy for"), translate("Comma delimited list, e.g. 127.0.0.*, 10.*, 192.168.*"))
noproxy.default = "localhost, 127.0.0.*, 10.*, 192.168.*"
noproxy.rmempty = false

bind=s:option(Value, "bind", translate("Bind interface"))
bind.rmempty = true
bind.datatype = "ip4addr"

listen_port=s:option(Value, "listen_port", translate("Listen port"))
listen_port.default = "3128"
listen_port.rmempty = false
listen_port.datatype = "port"

workstation=s:option(Value, "workstation", translate("Workstation name"))
workstation.default = "netbios1"
workstation.rmempty = false

-- Other useful options

socks5_port=s:option(Value, "socks5_port", translate("Socks5 port"), translate("Leave empty to disable SOCKS5 proxy, the most common is 1080"))
socks5_port.rmempty = true
socks5_port.datatype = "port"

socks5_users=s:option(DynamicList, "socks5_users", translate("Socks5 users"), translate("Enter username and password delimited by colon, e.g. bob:secret"))
socks5_users.cast = "table"
socks5_users.rmempty = true

tunnels=s:option(DynamicList, "tunnels", translate("Tunnels"), translate("Syntax is the same as OpenSSH local forwarding, i.e. [<i>src_ip</i>]:<i>src_port</i>:<i>dest_ip</i>:<i>dest_port</i>"))
tunnels.cast = "table"
tunnels.rmempty = true

headers=s:option(DynamicList, "headers", translate("Headers"), translate("Add and replace fixed headers to the requests, e.g. Browser: Mozilla"))
headers.cast = "table"
tunnels.rmempty = true

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
