library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        n               : integer := 8
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        op              : in     vl_logic_vector(2 downto 0);
        sum             : out    vl_logic_vector;
        o_flag          : out    vl_logic;
        z_flag          : out    vl_logic;
        n_flag          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end ALU;
