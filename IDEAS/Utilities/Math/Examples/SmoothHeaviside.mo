within IDEAS.Utilities.Math.Examples;
model SmoothHeaviside "Test model for smoothHeavisidefunction "
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp x1(duration=1,
    height=2,
    offset=-1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  IDEAS.Utilities.Math.SmoothHeaviside smoothHeaviside(delta=0.1)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation
  connect(x1.y, smoothHeaviside.u) annotation (Line(
      points={{-39,0},{-10,0}},
      color={0,0,127}));
  annotation (  experiment(Tolerance=1e-6, StopTime=1.0),
__Dymola_Commands(file="modelica://IDEAS/Resources/Scripts/Dymola/Utilities/Math/Examples/SmoothHeaviside.mos"
        "Simulate and plot"), Documentation(info="<html>
<p>
This model tests the implementation of
<a href=\"modelica://IDEAS.Utilities.Math.SmoothHeaviside\">
IDEAS.Utilities.Math.SmoothHeaviside</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
July 17, 2015, by Marcus Fuchs:<br/>
First implementation.
</li>
</ul>
</html>"));
end SmoothHeaviside;