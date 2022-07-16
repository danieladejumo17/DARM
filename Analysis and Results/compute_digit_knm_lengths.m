function digit = compute_digit_knm_lengths(d_knm, d_viz, index)
    %% --------------------------------------------
    % Compute length of Digit Links
    % --------------------------------------------
    d_phalanx = d_knm.distal_phalanx;
    DP_length = norm(d_phalanx.head_transform(1,:) - d_phalanx.dip_joint_transform(1,:));
    
    m_phalanx = d_knm.middle_phalanx;
    MP_length = norm(m_phalanx.dip_joint_transform(1,:) - m_phalanx.pip_joint_transform(1,:));
    
    p_phalanx = d_knm.proximal_phalanx;
    PP_length = norm(p_phalanx.pip_joint_transform(1,:) - p_phalanx.mcp_joint_transform(1,:));
    
    if index == 5
      metacarpal = d_knm.metacarpal;
      MC_length = norm(metacarpal.mcp_joint_transform(1,:) - (metacarpal.cm_joint_transform(1,:)));
      
      % Ligament Length
      % TODO: Subtract Saddle Joint Z-Offset
      MC_head_ligament_length = d_knm.metacarpal_head_ligament.length;
    else
        MC_length = 0;
        MC_head_ligament_length = 0;
    end
    
    
    %% --------------------------------------------
    % Compute Visual Parameters of the joints
    % --------------------------------------------
    dip_radius = d_viz.dip_joint.radius;
    dip_length = d_viz.dip_joint.length;
    pip_radius = d_viz.pip_joint.radius;
    pip_length = d_viz.pip_joint.length;
    mcp_radius = d_viz.mcp_joint.radius;
    
    
    %% --------------------------------------------
    % Fill Digit Output
    % --------------------------------------------
    %     digit = struct("DP_"+index+"_length", DP_length, ...
    %         "MP_"+index+"_length", MP_length, ...
    %         "PP_"+index+"_length", PP_length, ...
    %         "DIP_Joint_"+index+"_Radius", dip_radius, "DIP_Joint_"+index+"_Length", dip_length, ...
    %         "PIP_Joint_"+index+"_Radius", pip_radius, "PIP_Joint_"+index+"_Length", pip_length, ...
    %         "MCP_Joint_"+index+"_Radius", mcp_radius);
    %      if index == 5
    %         digit.MC_5_length = MC_length;
    %         digit.MC_head_ligament_length = MC_head_ligament_length;
    %      end

    %     column_names = ["DP_Length", "MP_Length", "PP_Length", "MC_Lenght", ...
    %         "IP_Joint_Radius", "DIP_Joint_Radius", "PIP_Joint_Radius", "MCP_Joint_Radius", ...
    %         "IP_Joint_Length", "DIP_Joint_Length", "PIP_Joint_Length", "MCP_Joint_Length", ...
    %         "MC_head_ligament_length"];
    
    digit = [DP_length, MP_length, PP_length, MC_length, ...
        0, dip_radius, pip_radius, mcp_radius, ...
        0, dip_length, pip_length, 0, ...
        MC_head_ligament_length];
    
    
end