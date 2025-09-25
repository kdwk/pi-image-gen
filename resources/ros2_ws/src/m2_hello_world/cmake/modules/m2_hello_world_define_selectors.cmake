# Copyright (c) 2025 HKU Robocon Team
# Author: Kdwk (kdwk@connect.hku.hk)

include_guard(GLOBAL)

m2b_define_selector(M2_HELLO_WORLD_SELECTOR)

function(m2_hello_world_set_selectors selectors)
    m2b_set_selectors(M2_HELLO_WORLD_SELECTOR ${selectors})
endfunction()
