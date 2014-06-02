# Apply sysctl settings, including files in /etc/sysctl.d
function load_bash_aliases_d()
{
    for file in ~/.bash_aliases.d/* ; do
        #is_ignored_file "$file" && continue
        test -f "$file" && source "$file"
    done
}
load_bash_aliases_d


alias localmosaic="bash -c 'cd /Users/kkyzivat/builds/mosaic-work/Mosaic/web; mvn package; cd target/web/html; sudo python -m SimpleHTTPServer 80'"
alias mcinstance-a='aws describe-instances --filter "tag:Name=mc-`gitversion`-a" | awk -F "|" "{ print \$6 }" | xargs echo | sed "s/.*dnsName \([^ ]*\)/\1/"'
alias mcinstance-c='aws describe-instances --filter "tag:Name=mc-`gitversion`-c" | awk -F "|" "{ print \$6 }" | xargs echo | sed "s/.*dnsName \([^ ]*\)/\1/"'
alias base='open -a base '

function lssize() 
{
    ls -la $@/ | awk '{ print $5 " " $9 }' | sort -n | awk '
        function human(x) {
            s="kMGTPE";
            while (x>=1000 && length(s)>1)
                {x/=1024; s=substr(s,2)}
            return int(x+0.5) substr(s,1,1)
        }
        {
            gsub(/^[0-9]+/, human($1)); print
        }'
}

function ejectAll()
{
    find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject;
    if [[ $(find /Volumes -maxdepth 1 -not -user root -print | wc -l ) -eq 0 ]] ; then
        echo "Done";
    else
        echo "Volumes still connected:";
        find /Volumes -maxdepth 1 -not -user root -print;
    fi
}

function ip()
{
    if [ -n "$1" ]; then
        ipconfig getifaddr $1;
        return
    fi

    for ifnum in {0..10}; do
        ipaddr=$(ipconfig getifaddr en${ifnum});
        if [ -n "$ipaddr" ]; then
            echo $ipaddr;
            break
        fi
    done
}
