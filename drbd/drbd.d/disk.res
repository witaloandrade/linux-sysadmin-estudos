resource r0 {

    on DEBIANVM22 {

        device /dev/drbd0;

        disk /dev/vdb;

        address 10.10.10.22:7788;

        meta-disk internal;

    }
    on DEBIANVM23 {

        device /dev/drbd0;

        disk /dev/vdb;

        address 10.10.10.23:7788;

        meta-disk internal;

    }
}
