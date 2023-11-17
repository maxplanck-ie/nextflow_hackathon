params.str = 'Hello Thomas'

process splitLetters {
    output:
    path 'chunk_*'

    """
    printf '${params.str}' | split -b 6 - chunk_
    """
}

process convertToUpper {
    input:
    path x

    output:
    stdout

    script:
    """
    echo "String Manipulation:"
    cat $x | tr '[a-z]' '[A-Z]' | rev 
    echo "\nos-release:"
    cat /etc/os-release
    """
}

workflow {
    splitLetters | flatten | convertToUpper | view { it.trim() }
}
