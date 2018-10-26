within IDEAS.Examples.PPD12.BaseClasses;
partial model VentilationNoControl "Ppd 12 example model"
  extends IDEAS.Examples.PPD12.BaseClasses.HeatingNoControl(
    living(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    Diner(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    stairWay(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    bathRoom(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    bedRoom1(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    bedRoom2(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    bedRoom3(airModel(massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)),
    radGnd(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial),
    radBed1(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial),
    radBat2(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial),
    radBat1(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial),
    radBed2(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial),
    radBed3(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial));

  IDEAS.Fluid.Movers.FlowControlled_m_flow fanSup(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_air,
    tau=0,
    use_inputFilter=false,
    dp_nominal=300,
    redeclare package Medium = MediumAir,
    constantMassFlowRate=70*1.2/3600,
    inputType=IDEAS.Fluid.Types.InputType.Continuous)
                                          "Supply fan"
    annotation (Placement(transformation(extent={{360,118},{340,138}})));
  IDEAS.Fluid.Movers.FlowControlled_m_flow fanRet(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=m_flow_nominal_air,
    tau=0,
    use_inputFilter=false,
    dp_nominal=300,
    redeclare package Medium = MediumAir,
    constantMassFlowRate=70*1.2/3600,
    inputType=IDEAS.Fluid.Types.InputType.Continuous)
                                          "Return fan"
    annotation (Placement(transformation(extent={{340,180},{360,200}})));
  IDEAS.Fluid.Sources.Boundary_pT bouAir(
    nPorts=3,
    use_T_in=true,
    redeclare package Medium = MediumAir) "Boundary for air model"
    annotation (Placement(transformation(extent={{400,160},{380,180}})));
  IDEAS.Fluid.FixedResistances.Junction spl5(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumAir,
    m_flow_nominal={m_flow_nominal_air,m_flow_nominal_air,m_flow_nominal_air},
    dp_nominal={0,0,100})
    annotation (Placement(transformation(extent={{240,120},{220,140}})));
  IDEAS.Fluid.FixedResistances.Junction spl6(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumAir,
    m_flow_nominal={m_flow_nominal_air,m_flow_nominal_air,m_flow_nominal_air},
    dp_nominal={0,5,100})
    annotation (Placement(transformation(extent={{200,120},{180,140}})));
  IDEAS.Fluid.FixedResistances.Junction spl7(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumAir,
    m_flow_nominal={m_flow_nominal_air,m_flow_nominal_air,m_flow_nominal_air},
    dp_nominal={200,0,27},
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering)
    annotation (Placement(transformation(extent={{140,180},{160,200}})));
  IDEAS.Fluid.FixedResistances.Junction spl8(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumAir,
    m_flow_nominal={m_flow_nominal_air,m_flow_nominal_air,m_flow_nominal_air},
    dp_nominal={0,5,100})
    annotation (Placement(transformation(extent={{120,120},{100,140}})));
  Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = MediumAir,
    redeclare package Medium2 = MediumAir,
    m1_flow_nominal=m_flow_nominal_air,
    m2_flow_nominal=m_flow_nominal_air,
    eps=0.75,
    dp1_nominal=65,
    dp2_nominal=225) "Heat recovery unit"
    annotation (Placement(transformation(extent={{280,150},{300,170}})));
  Modelica.Blocks.Sources.RealExpression Te(y=sim.Te) "Ambient air"
    annotation (Placement(transformation(extent={{360,80},{380,100}})));
  Fluid.Actuators.Valves.Simplified.ThreeWayValveMotor bypassRet(redeclare
      package Medium = MediumAir, m_flow_nominal=0.1)
    "Return air bypass control valve"
    annotation (Placement(transformation(extent={{300,180},{320,200}})));
  Fluid.FixedResistances.Junction       spl9(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    m_flow_nominal={m_flow_nominal_air,m_flow_nominal_air,m_flow_nominal_air},
    redeclare package Medium = MediumAir,
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{260,180},{280,200}})));
  Fluid.FixedResistances.Junction       spl10(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    m_flow_nominal={m_flow_nominal_air,m_flow_nominal_air,m_flow_nominal_air},
    redeclare package Medium = MediumAir,
    dp_nominal={0,0,0})
    annotation (Placement(transformation(extent={{260,140},{280,120}})));
  Fluid.Actuators.Valves.Simplified.ThreeWayValveMotor bypassSup(redeclare
      package Medium = MediumAir, m_flow_nominal=0.1)
    "Supply air bypass control valve"
    annotation (Placement(transformation(extent={{300,140},{320,120}})));
equation
  connect(hallway.proBusD[1], living.proBusB[1]) annotation (Line(
      points={{-72.4,57},{-45,57},{-45,40}},
      color={255,204,51},
      thickness=0.5));
  connect(Diner.proBusC[1], living.proBusA[1]) annotation (Line(
      points={{-29.2,-18.2},{-30,-18.2},{-30,37}},
      color={255,204,51},
      thickness=0.5));
  connect(Diner.proBusExt[1], hallway.proBusA[1]) annotation (Line(
      points={{-48,-36.5},{-76,-36.5},{-76,41}},
      color={255,204,51},
      thickness=0.5));
  connect(Diner.proBusExt[2], com1.propsBus_a) annotation (Line(
      points={{-48,-37.5},{-48,-36},{-94.8333,-36},{-94.8333,-60}},
      color={255,204,51},
      thickness=0.5));
  connect(out1.propsBus_a, Diner.proBusExt[3]) annotation (Line(
      points={{-91,-89.8333},{-91,-38.5},{-48,-38.5}},
      color={255,204,51},
      thickness=0.5));
  connect(Porch.proBusC[1], Diner.proBusA[1]) annotation (Line(
      points={{-27.2,-66.2},{-27.2,-48},{-42,-48},{-42,-37}},
      color={255,204,51},
      thickness=0.5));
  connect(Porch.proBusD[1], Diner.proBusExt[4]) annotation (Line(
      points={{-43.6,-69},{-88,-69},{-88,-38},{-48,-38},{-48,-39.5}},
      color={255,204,51},
      thickness=0.5));
  connect(bedRoom1.proBusFlo[1], cei2.propsBus_a) annotation (Line(
      points={{130,76},{120,76},{120,60},{103.167,60}},
      color={255,204,51},
      thickness=0.5));
  connect(cei2.propsBus_b, living.proBusCei[1]) annotation (Line(
      points={{94.8333,60},{-35.8,60},{-35.8,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bedRoom1.proBusExt[1], cei1.propsBus_a) annotation (Line(
      points={{142,61},{144,61},{144,80},{79.1667,80}},
      color={255,204,51},
      thickness=0.5));
  connect(cei1.propsBus_b, hallway.proBusCei[1]) annotation (Line(
      points={{70.8333,80},{-81.8,80},{-81.8,44}},
      color={255,204,51},
      thickness=0.5));
  connect(bedRoom1.proBusA[1], bathRoom.proBusC[1]) annotation (Line(
      points={{136,61},{136,52},{136,25.8},{123.2,25.8}},
      color={255,204,51},
      thickness=0.5));
  connect(bathRoom.proBusFlo[1], living.proBusExt[1]) annotation (Line(
      points={{130,22},{96,22},{96,32},{96,38},{-24,38},{-24,36}},
      color={255,204,51},
      thickness=0.5));
  connect(stairWay.proBusC[1], bedRoom1.proBusExt[2]) annotation (Line(
      points={{69.2,25.8},{69.2,25.8},{69.2,50},{76,50},{142,50},{142,59}},
      color={255,204,51},
      thickness=0.5));
  connect(stairWay.proBusFlo[1], hallway.proBusExt[1]) annotation (Line(
      points={{76,22},{46,22},{-70,22},{-70,40}},
      color={255,204,51},
      thickness=0.5));
  connect(stairWay.proBusD[1], bathRoom.proBusB[1]) annotation (Line(
      points={{85.6,23},{121,23},{121,10}},
      color={255,204,51},
      thickness=0.5));
  connect(bedRoom2.proBusFlo[1], bedRoom1.proBusCei[1]) annotation (Line(
      points={{266,78},{266,90},{192,90},{192,64},{130.2,64}},
      color={255,204,51},
      thickness=0.5));
  connect(bedRoom3.proBusC[1], bedRoom2.proBusA[1]) annotation (Line(
      points={{263.2,39.8},{264,39.8},{264,63},{272,63}},
      color={255,204,51},
      thickness=0.5));
  connect(bedRoom3.proBusFlo[1], bathRoom.proBusCei[1]) annotation (Line(
      points={{270,36},{202,36},{202,10},{130.2,10}},
      color={255,204,51},
      thickness=0.5));
  connect(out2.propsBus_a, bedRoom3.proBusA[1]) annotation (Line(
      points={{233,2.16667},{233,14},{276,14},{276,21}},
      color={255,204,51},
      thickness=0.5));
  connect(winBed3.propsBus_a, bedRoom3.proBusExt[1]) annotation (Line(
      points={{307,2.16667},{307,21.3333},{282,21.3333}},
      color={255,204,51},
      thickness=0.5));
  connect(Roof1.propsBus_a, bedRoom3.proBusExt[2]) annotation (Line(
      points={{281,2.16667},{281,11.5},{282,11.5},{282,20}},
      color={255,204,51},
      thickness=0.5));
  connect(Roof2.propsBus_a, bedRoom3.proBusCei[1]) annotation (Line(
      points={{261,2.16667},{261,24},{270.2,24}},
      color={255,204,51},
      thickness=0.5));
  connect(cei3.propsBus_a, bedRoom3.proBusExt[3]) annotation (Line(
      points={{191.167,-10},{282,-10},{282,18.6667}},
      color={255,204,51},
      thickness=0.5));
  connect(cei3.propsBus_b, stairWay.proBusCei[1]) annotation (Line(
      points={{182.833,-10},{76.2,-10},{76.2,10}},
      color={255,204,51},
      thickness=0.5));
  connect(fanSup.port_a, bouAir.ports[1]) annotation (Line(points={{360,128},{
          380,128},{380,172.667}},
                           color={0,127,255}));
  connect(fanRet.port_b, bouAir.ports[2]) annotation (Line(points={{360,190},{
          380,190},{380,170}},
                           color={0,127,255}));
  connect(spl5.port_3, bedRoom2.port_b) annotation (Line(points={{230,120},{230,
          58},{268,58},{268,62}},                color={0,127,255}));
  connect(bedRoom2.port_a, bedRoom3.port_a) annotation (Line(points={{
          264,62},{254,62},{250,62},{250,20},{268,20}}, color={0,127,255}));
  connect(spl6.port_3, bedRoom3.port_a) annotation (Line(points={{190,120},{190,
          20},{268,20}},                 color={0,127,255}));
  connect(stairWay.port_b, bedRoom3.port_b) annotation (Line(points=
         {{78,6},{80,6},{80,0},{80,8},{272,8},{272,20}}, color={0,127,255}));
  connect(stairWay.port_a, bathRoom.port_a) annotation (Line(points={{
          74,6},{74,6},{74,-6},{74,-4},{128,-4},{128,6}}, color={0,127,255}));
  connect(bedRoom1.port_a, stairWay.port_b) annotation (Line(points={
          {128,60},{122,60},{122,56},{78,56},{78,6}}, color={0,127,255}));
  connect(spl7.port_3, bathRoom.port_b)
    annotation (Line(points={{150,180},{150,6},{132,6}}, color={0,127,255}));
  connect(spl6.port_1, spl5.port_2) annotation (Line(points={{200,130},{220,130}},
                      color={0,127,255}));
  connect(spl8.port_1, spl6.port_2)
    annotation (Line(points={{120,130},{180,130}}, color={0,127,255}));
  connect(spl8.port_3, bedRoom1.port_b) annotation (Line(points={{110,120},{110,
          106},{132,106},{132,60}},      color={0,127,255}));
  connect(spl8.port_2, living.port_a) annotation (Line(points={{100,130},{-38,
          130},{-38,36}}, color={0,127,255}));
  connect(living.port_b, Diner.port_a) annotation (Line(points={{-34,
          36},{-34,-38},{-34,-38}}, color={0,127,255}));
  connect(Diner.port_b, spl7.port_1) annotation (Line(points={{-38,-38},{-40,
          -38},{-40,-2},{-42,-2},{-42,190},{140,190}}, color={0,127,255}));
  connect(Diner.port_a, bouAir.ports[3]) annotation (Line(points={{-34,-38},{30,
          -38},{30,214},{380,214},{380,167.333}},     color={0,127,255}));
  connect(Te.y, bouAir.T_in) annotation (Line(points={{381,90},{400,90},{400,
          174},{402,174}}, color={0,0,127}));
  connect(bypassRet.port_b, fanRet.port_a)
    annotation (Line(points={{320,190},{340,190}}, color={0,127,255}));
  connect(hex.port_b1, bypassRet.port_a2) annotation (Line(points={{300,166},{
          310,166},{310,180}}, color={0,127,255}));
  connect(spl9.port_2, bypassRet.port_a1)
    annotation (Line(points={{280,190},{300,190}}, color={0,127,255}));
  connect(hex.port_a1, spl9.port_3) annotation (Line(points={{280,166},{270,166},
          {270,180}}, color={0,127,255}));
  connect(spl9.port_1, spl7.port_2)
    annotation (Line(points={{260,190},{160,190}}, color={0,127,255}));
  connect(spl10.port_1, spl5.port_1)
    annotation (Line(points={{260,130},{240,130}}, color={0,127,255}));
  connect(spl10.port_3, hex.port_b2) annotation (Line(points={{270,140},{270,
          154},{280,154}}, color={0,127,255}));
  connect(bypassSup.port_a1, spl10.port_2)
    annotation (Line(points={{300,130},{280,130}}, color={0,127,255}));
  connect(bypassSup.port_a2, hex.port_a2) annotation (Line(points={{310,140},{
          310,154},{300,154}}, color={0,127,255}));
  connect(bypassSup.port_b, fanSup.port_b) annotation (Line(points={{320,130},{
          340,130},{340,128}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -200},{400,240}},
        initialScale=0.1), graphics={
        Line(points={{-72,-100},{-100,-100},{-100,100},{-68,100},{-68,-10},{0,-10},
              {0,100},{-68,100}}, color={28,108,200}),
        Line(points={{-72,-98}}, color={28,108,200}),
        Line(points={{-72,-100},{-72,-50},{0,-50},{0,-8}}, color={28,108,200}),
        Line(points={{-60,-10},{-100,-10}}, color={28,108,200}),
        Line(points={{-72,-100},{0,-100},{0,-50}}, color={28,108,200}),
        Line(points={{60,100},{160,100},{160,46},{60,46},{60,100}}, color={28,108,
              200}),
        Line(
          points={{92,100},{92,46}},
          color={28,108,200},
          pattern=LinePattern.Dash),
        Line(points={{60,46},{160,46},{160,-8},{60,-8},{60,46}}, color={28,108,200}),
        Line(points={{92,46},{92,-8}}, color={28,108,200}),
        Line(points={{220,100},{320,100},{320,46},{220,46},{220,100}},
                                                                    color={28,108,
              200}),
        Line(points={{220,46},{320,46},{320,-8},{220,-8},{220,46}}, color={28,108,
              200}),
        Line(
          points={{-68,46},{0,46}},
          color={28,108,200},
          pattern=LinePattern.Dash)}),
                                Icon(coordinateSystem(
        preserveAspectRatio=false,
        initialScale=0.1)),
    Documentation(info="<html>
<p>
Example model of a partially renovated terraced house in Belgium.
This model adds the building ventilation system.
</p>
</html>", revisions="<html>
<ul>
<li>
October 26, 2018, by Filip Jorissen:<br/>
Partial created for 
See <a href=\"https://github.com/open-ideas/IDEAS/issues/942\">#942</a>.
</li>
</ul>
</html>"));
end VentilationNoControl;
