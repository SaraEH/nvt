###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_smb_check_vulns.nasl 12115 2018-10-26 09:30:41Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803571");
  script_version("$Revision: 12115 $");
  script_cve_id("CVE-2006-2370", "CVE-2006-2371", "CVE-2007-1748", "CVE-2008-4250", "CVE-2009-3103");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 11:30:41 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:01:00 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: smb-check-vulns");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl");
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"smbport", value:"", type:"entry");
  script_add_preference(name:"randomseed", value:"", type:"entry");
  script_add_preference(name:"smbbasic", value:"", type:"entry");
  script_add_preference(name:"smbsign", value:"", type:"entry");
  script_add_preference(name:"safe", value:"", type:"entry");
  script_add_preference(name:"unsafe", value:"", type:"entry");

  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/security-updates/securityadvisories/2009/975497");
  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/security-updates/securitybulletins/2007/ms07-029");
  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/security-updates/securitybulletins/2006/ms06-025");
  script_xref(name:"URL", value:"https://docs.microsoft.com/en-us/security-updates/securitybulletins/2008/ms08-067");

  script_tag(name:"summary", value:"Checks for vulnerabilities:

  - MS08-067, a Windows RPC vulnerability

  - Conficker, an infection by the Conficker worm

  - Unnamed regsvc DoS, a denial-of-service vulnerability I accidentally found in Windows 2000

  - SMBv2 exploit (CVE-2009-3103, Microsoft Security Advisory 975497)

  - MS06-025, a Windows Ras RPC service vulnerability

  - MS07-029, a Windows Dns Server RPC service vulnerability

WARNING: These checks are dangerous, and are very likely to bring down a server.  These should not
be run in a production environment unless you (and, more importantly, the business) understand the
risks!

As a system administrator, performing these kinds of checks is crucial, because  a lot more damage
can be done by a worm or a hacker using this vulnerability than by a scanner. Penetration testers,
on the other hand, might not want to use this script -- crashing services is not generally a good
way of sneaking through a  network.

If you set the script parameter 'unsafe', then scripts will run that are almost  (or
totally) guaranteed to crash a vulnerable system; do NOT specify 'unsafe' in a production
environment! And that isn't to say that non-unsafe scripts will  not crash a system, they're just
less likely to.

If you set the script parameter 'safe', then script will run that rarely or never crash a
vulnerable system. No promises, though.

MS08-067. Checks if a host is vulnerable to MS08-067, a Windows RPC vulnerability that can allow
remote code execution.  Checking for MS08-067 is very dangerous, as the check  is likely to crash
systems. On a fairly wide scan conducted by Brandon Enright, we determined that on average, a
vulnerable system is more likely to crash than to survive the check. Out of 82 vulnerable systems,

SYNTAX:

smbport:       Override the default port choice. If 'smbport' is open, it's used. It's assumed
to be the same protocol as port 445, not port 139. Since it probably isn't possible to change
Windows' ports normally, this is mostly useful if you're bouncing through a relay or something.

randomseed:    Set to a value to change the filenames/service names that are randomly generated.

smbbasic:     Forces the authentication to use basic security, as opposed to 'extended security'.
Against most modern systems, extended security should work, but there may be cases
where you want to force basic. There's a chance that you'll get better results for
enumerating users if you turn on basic authentication.

smbsign:       Controls whether or not server signatures are checked in SMB packets. By default, on Windows,
server signatures aren't enabled or required. By default, this library will always sign
packets if it knows how, and will check signatures if the server says to. Possible values are:

  - 'force':      Always check server signatures, even if server says it doesn't support them (will
probably fail, but is technically more secure).

  - 'negotiate': [default] Use signatures if server supports them.

  - 'ignore':    Never check server signatures. Not recommended.

  - 'disable':   Don't send signatures, at all, and don't check the server's. not recommended.
More information on signatures can be found in 'smbauth.lua'.


safe:    If set, this script will only run checks that are known (or at
least suspected) to be safe.

unsafe:  If set, this script will run checks that, if the system isn't
patched, are basically guaranteed to crash something. Remember that
non-unsafe checks aren't necessarily safe either)");

  script_tag(name:"solution_type", value:"Mitigation");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

i = 0;

port = script_get_preference("smbport");
if (port !~ '^[0-9]+$')
{
  port = 445;
}

pref = script_get_preference("smbport");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbport', '=', pref, '"');
}
pref = script_get_preference("randomseed");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'randomseed', '=', pref, '"');
}
pref = script_get_preference("smbbasic");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbbasic', '=', pref, '"');
}
pref = script_get_preference("smbsign");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'smbsign', '=', pref, '"');
}
pref = script_get_preference("safe");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'safe', '=', pref, '"');
}
pref = script_get_preference("unsafe");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'unsafe', '=', pref, '"');
}

argv = make_list("nmap", "--script=smb-check-vulns.nse", "-p", port, get_host_ip());

if(i > 0) {
  scriptArgs = "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv, scriptArgs);
}

if(TARGET_IS_IPV6())
  argv = make_list(argv, "-6");

timing_policy = get_kb_item("Tools/nmap/timing_policy");
if(timing_policy =~ '^-T[0-5]$')
  argv = make_list(argv, timing_policy);

source_iface = get_preference("source_iface");
if(source_iface =~ '^[0-9a-zA-Z:_]+$') {
  argv = make_list(argv, "-e");
  argv = make_list(argv, source_iface);
}

res = pread(cmd:"nmap", argv:argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("smb-check-vulns" >< result) {
    msg = string('Result found by Nmap Security Scanner (smb-check-vulns.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
