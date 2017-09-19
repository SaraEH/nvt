###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_smb_brute_net.nasl 5499 2017-03-06 13:06:09Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "Attempts to guess username/password combinations over SMB, storing
discovered combinations for use in other scripts.

SYNTAX:

userdb:  The filename of an alternate username database.

brutelimit:  Limits the number of usernames checked in the script. In some
domains, it's possible to end up with 10,000+ usernames on each server. By
default, this will be '5000', which should be higher than most servers and also
prevent infinite loops or other weird things. This will only affect the user
list pulled from the server, not the username list. 

randomseed:    Set to a value to change the filenames/service names that are
randomly generated. 

unpwdb.timelimit:  The maximum amount of time that any iterator will run before
stopping. The value is in seconds by default and you can follow it with 'ms',
's', 'm', or 'h' for milliseconds, seconds, minutes, or hours. For example,
'unpwdb.timelimit=30m' or 'unpwdb.timelimit=.5h' for 30 minutes. The default
depends on the timing template level (see the module description). Use the value
'0' to disable the time limit.

unpwdb.userlimit:  The maximum number of usernames 'usernames' will return
(default unlimited).

smblockout:  Unless this is set to '1' or 'true', the script won't continue if it 
locks out an account or thinks it will lock out an account. 

smbport:       Override the default port choice. If 'smbport' is open, it's used. It's assumed
to be the same protocol as port 445, not port 139.

passdb:  The filename of an alternate password database.

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

canaries:  Sets the number of tests to do to attempt to lock out the first account. 
This will lock out the first account without locking out the rest of the accounts. 
The default is 3, which will only trigger strict lockouts, but will also bump the
canary account up far enough to detect a lockout well before other accounts are
hit. 

unpwdb.passlimit:  The maximum number of passwords 'passwords' will return
(default unlimited).";

if(description)
{
    script_id(104145);
    script_version("$Revision: 5499 $");
    script_tag(name:"last_modification", value:"$Date: 2017-03-06 14:06:09 +0100 (Mon, 06 Mar 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_name("Nmap NSE net: smb-brute");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"userdb", value:"", type:"entry");
    script_add_preference(name:"brutelimit", value:"", type:"entry");
    script_add_preference(name:"randomseed", value:"", type:"entry");
    script_add_preference(name:"unpwdb.timelimit", value:"", type:"entry");
    script_add_preference(name:"unpwdb.userlimit", value:"", type:"entry");
    script_add_preference(name:"smblockout", value:"", type:"entry");
    script_add_preference(name:"smbport", value:"", type:"entry");
    script_add_preference(name:"passdb", value:"", type:"entry");
    script_add_preference(name:"smbbasic", value:"", type:"entry");
    script_add_preference(name:"smbsign", value:"", type:"entry");
    script_add_preference(name:"canaries", value:"", type:"entry");
    script_add_preference(name:"unpwdb.passlimit", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");

# The corresponding NSE script does't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("userdb");
    if (!isnull(pref) && pref != "") {
        argv["userdb"] = string('"', pref, '"');
    }
    pref = script_get_preference("brutelimit");
    if (!isnull(pref) && pref != "") {
        argv["brutelimit"] = string('"', pref, '"');
    }
    pref = script_get_preference("randomseed");
    if (!isnull(pref) && pref != "") {
        argv["randomseed"] = string('"', pref, '"');
    }
    pref = script_get_preference("unpwdb.timelimit");
    if (!isnull(pref) && pref != "") {
        argv["unpwdb.timelimit"] = string('"', pref, '"');
    }
    pref = script_get_preference("unpwdb.userlimit");
    if (!isnull(pref) && pref != "") {
        argv["unpwdb.userlimit"] = string('"', pref, '"');
    }
    pref = script_get_preference("smblockout");
    if (!isnull(pref) && pref != "") {
        argv["smblockout"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbport");
    if (!isnull(pref) && pref != "") {
        argv["smbport"] = string('"', pref, '"');
    }
    pref = script_get_preference("passdb");
    if (!isnull(pref) && pref != "") {
        argv["passdb"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbbasic");
    if (!isnull(pref) && pref != "") {
        argv["smbbasic"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbsign");
    if (!isnull(pref) && pref != "") {
        argv["smbsign"] = string('"', pref, '"');
    }
    pref = script_get_preference("canaries");
    if (!isnull(pref) && pref != "") {
        argv["canaries"] = string('"', pref, '"');
    }
    pref = script_get_preference("unpwdb.passlimit");
    if (!isnull(pref) && pref != "") {
        argv["unpwdb.passlimit"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"smb-brute", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"smb-brute");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (smb-brute.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}