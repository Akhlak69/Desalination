model desal_full
replaceable package Water = ThermoPower.Water.StandardWater constrainedby Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
  ThermoPower.Water.SteamTurbineStodola steamTurbineStodola1(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-24, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola steamTurbineStodola(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-64, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(
    Placement(visible = true, transformation(origin = {-88, -67}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{-38, 18}, {-58, 38}}, rotation = 0)));
  ThermoPower.Water.SensT sensT annotation(
    Placement(visible = true, transformation(origin = {-76, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  ThermoPower.Water.SensW sensW annotation(
    Placement(visible = true, transformation(origin = {-76, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain MW2W(k = 1e6) annotation(
    Placement(visible = true, transformation(extent = {{-128, -79.5}, {-118, -68.5}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable q_F_Tab(table = [0, 0; 3600, 400; 7210, 400]) annotation(
    Placement(visible = true, transformation(extent = {{-166, -84}, {-146, -64}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(V_l_start = 0.1, V_t = 10, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 300e3, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start = 1000000) annotation(
    Placement(visible = true, transformation(extent = {{-98, -12}, {-78, 8}}, rotation = 0)));
  ThermoPower.PowerPlants.SteamTurbineGroup.Components.CondenserPreP condenserPreP1(p(displayUnit = "Pa") = 5389.2) annotation(
    Placement(visible = true, transformation(origin = {42, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  ThermoPower.Examples.RankineCycle.Models.PrescribedSpeedPump prescribedSpeedPump(redeclare package FluidMedium = Water, SSInit = false, head_nom = {450, 300, 0}, n0 = 1000, nominalInletPressure(displayUnit = "Pa") = 50000, nominalMassFlowRate = 100, nominalOutletPressure(displayUnit = "Pa") = 3000000, q_nom = {0, 0.055, 0.1}, rho0(displayUnit = "g/cm3") = 1000) annotation(
    Placement(visible = true, transformation(origin = {45, -15}, extent = {{-7, 7}, {7, -7}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{6, 20}, {-14, 40}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1116.5) annotation(
    Placement(visible = true, transformation(origin = {40, 18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola steamTurbineStodola2(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {62, 70}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed2(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{98, 90}, {78, 110}}, rotation = 0)));
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-138, 102}, extent = {{8, 8}, {-8, -8}}, rotation = 0)));
  inner Modelica.Fluid.System system2 annotation(
    Placement(visible = true, transformation(origin = {-166, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkPressure sinkPressure annotation(
    Placement(visible = true, transformation(origin = {138, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 2000000) annotation(
    Placement(visible = true, transformation(origin = {68, 2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 2) annotation(
    Placement(visible = true, transformation(origin = {70, -78}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Desal desal annotation(
    Placement(visible = true, transformation(origin = {152, 6}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  ThermoPower.Water.SourceW Potable_source annotation(
    Placement(visible = true, transformation(origin = {212, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.Tank tank(A = 1, V0 = 1, allowFlowReversal = false, y(start = 0.1), y0 = 1, ystart = 0.1) annotation(
    Placement(visible = true, transformation(origin = {46, -48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.SensW sensW2 annotation(
    Placement(visible = true, transformation(origin = {12, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkW Potable_sink annotation(
    Placement(visible = true, transformation(origin = {-20, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy (redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {74, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1 (redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {-44, -59}, extent = {{9, 8}, {-9, -8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput enthalpy_flow annotation(
    Placement(visible = true, transformation(origin = {172, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SensW sensW1 annotation(
    Placement(visible = true, transformation(origin = {95, -9}, extent = {{-9, -9}, {9, 9}}, rotation = -90)));
  ThermoPower.Water.SourceW feedback_source annotation(
    Placement(visible = true, transformation(origin = {-22, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.SensT sensT1 annotation(
    Placement(visible = true, transformation(origin = {104, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(constantSpeed.flange, steamTurbineStodola.shaft_b) annotation(
    Line(points = {{-58, 28}, {-58, 70}}));
  connect(sensW.outlet, steamTurbineStodola.inlet) annotation(
    Line(points = {{-72, 50}, {-72, 78}}, color = {0, 0, 255}));
  connect(evaporator.heatPort, furnace.port) annotation(
    Line(points = {{-88, -12}, {-88, -57}}, color = {191, 0, 0}));
  connect(evaporator.port_b, sensT.inlet) annotation(
    Line(points = {{-78, -2}, {-72, -2}, {-72, 12}}, color = {0, 127, 255}));
  connect(sensT.outlet, sensW.inlet) annotation(
    Line(points = {{-72, 24}, {-72, 38}}, color = {0, 0, 255}));
  connect(steamTurbineStodola.outlet, steamTurbineStodola1.inlet) annotation(
    Line(points = {{-56, 78}, {-32, 78}}, color = {0, 0, 255}));
  connect(q_F_Tab.y, MW2W.u) annotation(
    Line(points = {{-144, -74}, {-128, -74}}, color = {0, 0, 127}));
  connect(MW2W.y, furnace.Q_flow) annotation(
    Line(points = {{-118, -74}, {-88, -74}, {-88, -76}}, color = {0, 0, 127}));
  connect(steamTurbineStodola1.shaft_b, constantSpeed1.flange) annotation(
    Line(points = {{-18, 70}, {-14, 70}, {-14, 30}}));
  connect(steamTurbineStodola1.outlet, condenserPreP1.steamIn) annotation(
    Line(points = {{-16, 78}, {32, 78}, {32, 42}}, color = {0, 0, 255}));
  connect(const.y, prescribedSpeedPump.nPump) annotation(
    Line(points = {{47, 18}, {50, 18}, {50, -11}}, color = {0, 0, 127}));
  connect(condenserPreP1.waterOut, prescribedSpeedPump.inlet) annotation(
    Line(points = {{52, 42}, {52, -15}}, color = {0, 0, 255}));
  connect(prescribedSpeedPump.outlet, evaporator.port_a) annotation(
    Line(points = {{38, -15}, {-98, -15}, {-98, -2}}, color = {0, 0, 255}));
  connect(evaporator.port_b, steamTurbineStodola2.inlet) annotation(
    Line(points = {{-78, -2}, {-88, -2}, {-88, 86}, {52, 86}, {52, 80}}, color = {0, 127, 255}));
  connect(steamTurbineStodola2.shaft_b, constantSpeed2.flange) annotation(
    Line(points = {{70, 70}, {78, 70}, {78, 100}}));
  connect(Potable_source.flange, tank.inlet) annotation(
    Line(points = {{202, -54}, {54, -54}}, color = {0, 0, 255}));
  connect(tank.outlet, sensW2.inlet) annotation(
    Line(points = {{38, -54}, {18, -54}}, color = {0, 0, 255}));
  connect(sensW2.outlet, Potable_sink.flange) annotation(
    Line(points = {{6, -54}, {-10, -54}, {-10, -76}}, color = {0, 0, 255}));
  connect(steamTurbineStodola2.outlet, specificEnthalpy.port) annotation(
    Line(points = {{72, 80}, {72, 54}, {84, 54}, {84, 30}}, color = {0, 0, 255}));
  connect(specificEnthalpy1.h_out, enthalpy_flow) annotation(
    Line(points = {{-54, -59}, {-54, -90}, {172, -90}}, color = {0, 0, 127}));
  connect(specificEnthalpy1.port, evaporator.port_a) annotation(
    Line(points = {{-44, -51}, {-112, -51}, {-112, -2}, {-98, -2}}));
  connect(specificEnthalpy.h_out, desal.steam_enthalpy) annotation(
    Line(points = {{74, 19}, {119, 19}, {119, 20}}, color = {0, 0, 127}));
  connect(sensW1.w, desal.steam_flowrate) annotation(
    Line(points = {{100, -16}, {109, -16}, {109, -7}, {119, -7}}, color = {0, 0, 127}));
  connect(constant1.y, desal.seawater_enthalpy) annotation(
    Line(points = {{75, 2}, {93.5, 2}, {93.5, 7}, {119, 7}}, color = {0, 0, 127}));
  connect(constant2.y, desal.seawater_flowrate) annotation(
    Line(points = {{77, -78}, {108, -78}, {108, -19}, {118, -19}}, color = {0, 0, 127}));
  connect(desal.potable_storage, Potable_sink.in_w0) annotation(
    Line(points = {{183, 5}, {190, 5}, {190, -60}, {-16, -60}, {-16, -70}}, color = {0, 0, 127}));
  connect(desal.potable_storage, Potable_source.in_w0) annotation(
    Line(points = {{183, 5}, {216, 5}, {216, -48}}, color = {0, 0, 127}));
  connect(feedback_source.in_w0, desal.feedback_flow) annotation(
    Line(points = {{-18, -36}, {194, -36}, {194, 12}, {183, 12}}, color = {0, 0, 127}));
  connect(feedback_source.in_h, desal.enthalpy_potable) annotation(
    Line(points = {{-26, -36}, {-26, -24}, {183, -24}, {183, -9}}, color = {0, 0, 127}));
  connect(feedback_source.flange, specificEnthalpy1.port) annotation(
    Line(points = {{-32, -42}, {-44, -42}, {-44, -51}}, color = {0, 0, 255}));
  connect(specificEnthalpy.port, sensW1.inlet) annotation(
    Line(points = {{84, 30}, {91, 30}, {91, -4}}, color = {0, 127, 255}));
  connect(sinkPressure.flange, sensT1.outlet) annotation(
    Line(points = {{128, -106}, {110, -106}}, color = {0, 0, 255}));
  connect(sensT1.inlet, sensW1.outlet) annotation(
    Line(points = {{98, -106}, {91, -106}, {91, -14}}, color = {0, 0, 255}));
protected
  annotation(
    uses(ThermoPower(version = "3.1"), Modelica(version = "3.2.3")),
  Diagram(coordinateSystem(extent = {{-180, 120}, {220, -120}})),
  version = "");
end desal_full;
