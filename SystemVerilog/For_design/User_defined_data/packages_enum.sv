`ifndef PACKAGES_DEF
    `define PACKAGES_DEF
    
        package packages;
        
            typedef enum int {RED, GREEN, BLUE} RGB_T;
            // COVERAGE = 0, CHECKS=1, FATAL=2, DEFAULT0=3, DEFAULT1=4
            typedef enum int {COVERAGE, CHECKS, FATAL, DEFAULT[2]} FLAGS_T;
        endpackage
        import packages::*;
`endif