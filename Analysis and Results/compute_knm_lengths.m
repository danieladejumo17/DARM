function out = compute_knm_lengths(knm, viz)
    % --------------------------------------------
    % Compute length of Digit 1 Links
    % --------------------------------------------
    d1 = knm.d1;
    d_phalanx = d1.distal_phalanx;
    DP_length = norm(d_phalanx.head_transform(1,:) - d_phalanx.ip_joint_transform(1,:));
    
    p_phalanx = d1.proximal_phalanx;
    PP_length = norm(p_phalanx.ip_joint_transform(1,:) - p_phalanx.mcp_joint_transform(1,:));
    
    metacarpal = d1.metacarpal;
    % Add Z=knm.carpals.cm_i_joint_centre_block_dim(3) from cm_joint_transform
    Z_offset = [0 0 knm.carpals.cm_i_joint_centre_block_dim(3)];
    MC_length = norm(metacarpal.mcp_joint_transform(1,:) - ...
        (metacarpal.cm_joint_transform(1,:) + Z_offset));
    
    d1_viz = viz.d1;
    ip_radius = d1_viz.ip_joint.radius;
    ip_length = d1_viz.ip_joint.length;
    mcp_radius = d1_viz.mcp_joint.radius;
    mcp_length = d1_viz.mcp_joint.length;
    
    % --------------------------------------------
    % Fill Digit 1 Output
    % --------------------------------------------
    %     column_names = ["DP_Length", "MP_Length", "PP_Length", "MC_Lenght", ...
    %         "IP_Joint_Radius", "DIP_Joint_Radius", "PIP_Joint_Radius", "MCP_Joint_Radius", ...
    %         "IP_Joint_Length", "DIP_Joint_Length", "PIP_Joint_Length", "MCP_Joint_Length", ...
    %         "MC_head_ligament_length"];

    %     digit1 = struct("DP_1_length", DP_length, ...
    %         "PP_1_length", PP_length, ...
    %         "MC_1_length", MC_length, ...
    %         "IP_Joint_1_Radius", ip_radius, "IP_Joint_1_length", ip_length, ...
    %         "MCP_Joint_1_Radius", mcp_radius, "MCP_Joint_1_length", mcp_length);

    digit1 = [DP_length, 0, PP_length, MC_length, ...
        ip_radius, 0, 0, mcp_radius, ...
        ip_length, 0, 0, mcp_length, ...
        0];
    
    
    
    % --------------------------------------------
    % Fill Digit 2 - 5 Outputs
    % --------------------------------------------
    digit2 = compute_digit_knm_lengths(knm.d2, viz.d2, 2);
    digit3 = compute_digit_knm_lengths(knm.d3, viz.d3, 3);
    digit4 = compute_digit_knm_lengths(knm.d4, viz.d4, 4);
    digit5 = compute_digit_knm_lengths(knm.d5, viz.d5, 5);
    
    
    
    % --------------------------------------------
    % Fill Output
    % --------------------------------------------
    %     out = struct("Digit_1", digit1, ...
    %         "Digit_2", digit2, ...
    %         "Digit_3", digit3, ...
    %         "Digit_4", digit4, ...
    %         "Digit_5", digit5);
    
    out = [digit1; digit2; digit3; digit4; digit5];
end