config_path=${CONFIG_PATH:-/config}
dest_path=${FPM_CONFIG_PATH:-/etc}

destfilename() {
    sourcefile=$1
    prefix=$2

    echo $(echo $(basename $sourcefile) | sed "s/^$prefix-//")
}

if [ -d $config_path ]; then
    for f in $(find ${config_path} -maxdepth 1 -type f -name '*.conf' -o -name '*.ini');do
        case $(basename $f) in
            php.d-*)
                [ -d $dest_path/php.d ] || mkdir -pv $dest_path/php.d
                cp -fv $f $dest_path/php.d/$(destfilename $f "php.d")
                ;;
            php-fpm.d-*)
                [ -d $dest_path/php-fpm.d ] || mkdir -pv $dest_path/php-fpm.d
                cp -fv $f $dest_path/php-fpm.d/$(destfilename $f "php-fpm.d")
                ;;
            php-zts.d-*)
                [ -d $dest_path/php-zts.d ] || mkdir -pv $dest_path/php-zts.d
                cp -fv $f $dest_path/php-zts.d/$(destfilename $f "php-zts.d")
                ;;
            *)
                cp -fv $f ${dest_path}/
                ;;
        esac
    done
fi
