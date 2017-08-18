#!/usr/bin/env bash

# Get the Cleanup script
cleanup_script_name="cleanup.sh"

cleanup_files(){
    #execute the script
    echo Running: $(find -name ${cleanup_script_name})
    bash $(find -name ${cleanup_script_name})
}

docs_cleanup(){
    cd ${outdir}
    mkdir docs
    file_formats_supported="*.otf *.doc *.pdf *.docx *.txt *.xls *.xlsx"
    for fmt in ${file_formats_supported}; do
        find -name ${fmt} | grep "CMakeLists" -v | xargs -n1 -i mv {} docs
    done
    cd -
}

create_out_dir(){
    echo "Reading output file data..."
    echo
    read -p "Enter your CSU_ID: "
    csuid=$(echo ${REPLY} | sed "s/[^0-9]//g")

    read -p "Full Name: "
    name=$(echo ${REPLY} | sed "s/[^a-zA-Z]//g")

    outdir="${csuid}_${name}"
    mkdir ${outdir}
}

copy_to_out(){
    echo "Copying files to ${outdir}"
    compress_files=$(find -maxdepth 1 -type d| grep "old_tars\|docs" -v)
    for lfile in ${compress_files} ;do
        echo "Copying ${lfile}"
        cp ${lfile} ${outdir} -r
    done
}

make_tar(){
    tar -czvf "${outdir}.tar.gz" ${outdir}
    rm -rf $outdir
}

cleanup_tar_files() {
    mkdir -p old_tars
    find -name *.tar.gz | xargs -n1 -i mv {} old_tars
}



# Rearranging sequence
cleanup_files
create_out_dir
cleanup_tar_files
copy_to_out
docs_cleanup
make_tar




