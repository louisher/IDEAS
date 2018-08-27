within IDEAS.Buildings.Components.LightControl;
block OccupancyBased
  "Lighting control from zone when nOcc > 0"
  extends BaseClasses.PartialLights(   final useOccInput=true);

  Modelica.Blocks.Sources.RealExpression realExpression(y=if lightOcc > 0 then
        1 else 0)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
equation
  connect(realExpression.y, ctrl)
    annotation (Line(points={{9,0},{120,0}}, color={0,0,127}));
  annotation (Documentation(revisions="<html>
<ul>
<li>
July 26, 2018 by Filip Jorissen:<br/>
First implementation
See <a href=\"https://github.com/open-ideas/IDEAS/issues/760\">#760</a>.
</li>
</ul>
</html>"));
end OccupancyBased;
