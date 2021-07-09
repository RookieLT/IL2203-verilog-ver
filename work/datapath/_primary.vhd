library verilog;
use verilog.vl_types.all;
entity datapath is
    generic(
        M               : integer := 3;
        N               : integer := 8
    );
    port(
        din             : in     vl_logic_vector;
        waddr           : in     vl_logic_vector;
        ra              : in     vl_logic_vector;
        rb              : in     vl_logic_vector;
        op              : in     vl_logic_vector(2 downto 0);
        ie              : in     vl_logic;
        write           : in     vl_logic;
        reada           : in     vl_logic;
        readb           : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        en              : in     vl_logic;
        oe              : in     vl_logic;
        offset          : in     vl_logic_vector;
        bypassa         : in     vl_logic;
        bypassb         : in     vl_logic;
        dout            : out    vl_logic_vector;
        o_flag          : out    vl_logic;
        z_flag          : out    vl_logic;
        n_flag          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of M : constant is 1;
    attribute mti_svvh_generic_type of N : constant is 1;
end datapath;
