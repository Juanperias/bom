ENTRY(boot)

SECTIONS {
  	. = 0x80200000;
	
        .text : {
	    *(.text*) *(.data*) *(.rodata*) *(.bss*)
	}

	PROVIDE(__end = .);
}
