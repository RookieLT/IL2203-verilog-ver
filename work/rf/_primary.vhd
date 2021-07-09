library verilog;
use verilog.vl_types.all;
entity rf is
    generic(
        M               : integer := 3;
        N               : integer := 8
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        wd              : in     vl_logic_vector;
        waddr           : in     vl_logic_vector;
        write           : in     vl_logic;
        ra              : in     vl_logic_vector;
        reada           : in     vl_logic;
        rb              : in     vl_logic_vector;
        readb           : in     vl_logic;
        qa              : out    vl_logic_vector;
        qb              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of M : constant is 1;
    attribute mti_svvh_generic_type of N : constant is 1;
end rf;
