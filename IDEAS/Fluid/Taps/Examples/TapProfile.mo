within IDEAS.Fluid.Taps.Examples;
model TapProfile "Example with two 'TapProfile' models"
  extends Modelica.Icons.Example;
  package Medium = IDEAS.Media.Water;

  IDEAS.Fluid.Taps.TapProfile tapProfile1(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  IDEAS.Fluid.Taps.TapProfile
                       tapProfile2(
                            redeclare package Medium = Medium, loadFile=
        Modelica.Utilities.Files.loadResource(
        "modelica://IDEAS/Resources/domestichotwaterprofiles/DHW_1year_2adults_2children.txt"))
    annotation (Placement(transformation(extent={{-10,-10},{10,-30}})));
  IDEAS.Fluid.Sources.Boundary_pT bou1(
    redeclare package Medium = Medium, use_T_in=true,
    nPorts=2)
    annotation (Placement(transformation(extent={{-60,10},{-40,-10}})));
  IDEAS.Fluid.Sources.Boundary_pT bou2(redeclare package Medium = Medium,
      nPorts=2)
    annotation (Placement(transformation(extent={{60,10},{40,-10}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=10,
    f=1/24/3600,
    offset=273.15 + 45)
    annotation (Placement(transformation(extent={{-90,-14},{-70,6}})));
equation

  connect(sine.y, bou1.T_in)
    annotation (Line(points={{-69,-4},{-62,-4}}, color={0,0,127}));
  connect(tapProfile1.port_b, bou2.ports[1]) annotation (Line(points={{10,20},{
          30,20},{30,1},{40,1}}, color={0,127,255}));
  connect(tapProfile2.port_b, bou2.ports[2]) annotation (Line(points={{10,-20},
          {30,-20},{30,-1},{40,-1}}, color={0,127,255}));
  connect(tapProfile1.port_a, bou1.ports[1]) annotation (Line(points={{-10,20},
          {-30,20},{-30,1},{-40,1}}, color={0,127,255}));
  connect(tapProfile2.port_a, bou1.ports[2]) annotation (Line(points={{-10,-20},
          {-30,-20},{-30,-1},{-40,-1}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=864000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(revisions="<html>
<ul>
<li>March 26, 2024, by Lucas Verleyen:<br>Initial implementation.<br>See <a href=\"https://github.com/open-ideas/IDEAS/issues/1287\">#1287</a> for more information. </li>
</ul>
</html>"));
end TapProfile;
