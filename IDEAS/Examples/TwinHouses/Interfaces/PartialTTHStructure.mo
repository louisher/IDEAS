within IDEAS.Examples.TwinHouses.Interfaces;
partial model PartialTTHStructure "Partial Model Based on Excel autogenerated"
  extends IDEAS.Templates.Interfaces.BaseClasses.Structure(
    redeclare each package Medium = IDEAS.Media.Air,
    nZones=7,
    nEmb=0);
  parameter Boolean includeTB=false
    "optional extension of model to include thermal bridges";
  parameter Boolean includeAirCoup=false
    "optional extension of model to include increased air coupling";
  parameter Integer exp=1 "Experiment number: 1 or 2";
  parameter Integer bui=1 "Building number 1 (N2), 2 (O5)";
  final parameter String filename = if exp==1 and bui== 1 then "BCTwinHouseN2Exp1.txt" elseif exp==2 and bui==1 then "BCTwinHouseN2Exp2.txt" else "BCTwinHouseO5.txt";
  final parameter String dirPath = Modelica.Utilities.Files.loadResource("modelica://IDEAS/Inputs/")
    annotation(Evaluate=true);
protected
  final parameter Modelica.SIunits.Angle incWall=IDEAS.Types.Tilt.Wall;
  final parameter Modelica.SIunits.Angle incCeil=IDEAS.Types.Tilt.Ceiling;
  final parameter Modelica.SIunits.Angle incFloor=IDEAS.Types.Tilt.Floor;
  final parameter Modelica.SIunits.Angle aziNorth=IDEAS.Types.Azimuth.N;
  final parameter Modelica.SIunits.Angle aziEast=IDEAS.Types.Azimuth.E;
  final parameter Modelica.SIunits.Angle aziSouth=IDEAS.Types.Azimuth.S;
  final parameter Modelica.SIunits.Angle aziWest=IDEAS.Types.Azimuth.W;

public
  Modelica.Blocks.Sources.CombiTimeTable inputAtticAndBasement(
    table=[0.0,0.0,0.0; 1000,1,1],
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    tableOnFile=true,
    tableName="data",
    fileName=dirPath + filename,
    columns={2,3},
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-140,-96},{-120,-76}})));
  Modelica.Blocks.Math.UnitConversions.From_degC[2] from_degC
    annotation (Placement(transformation(extent={{-104,-96},{-84,-76}})));
  BaseClasses.Structures.ThermalBridges thermalBridges if includeTB
    annotation (Placement(transformation(extent={{38,-96},{58,-76}})));
  BaseClasses.controlBlind controlBlind1(exp=exp,bui=bui)
    annotation (Placement(transformation(extent={{-52,-96},{-32,-76}})));
equation

  connect(thermalBridges.heatPortRad, heatPortRad);
  connect(thermalBridges.Tzone,TSensor);
  connect(thermalBridges.Te, sim.TEnv.y);
  connect(thermalBridges.Tatt, from_degC[1].y);
  connect(thermalBridges.Tbas, from_degC[2].y);

  connect(inputAtticAndBasement.y, from_degC.u) annotation (Line(points={{-119,-86},
          {-112.5,-86},{-106,-86}}, color={0,0,127}));

end PartialTTHStructure;
