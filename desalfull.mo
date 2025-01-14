model desalfull
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
    Placement(visible = true, transformation(extent = {{-156, 2}, {-136, 22}}, rotation = 0)));
  ThermoPower.PowerPlants.SteamTurbineGroup.Components.CondenserPreP condenserPreP1(p(displayUnit = "Pa") = 5389.2) annotation(
    Placement(visible = true, transformation(origin = {28, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  ThermoPower.Examples.RankineCycle.Models.PrescribedSpeedPump prescribedSpeedPump(redeclare package FluidMedium = Water, SSInit = false, head_nom = {450, 300, 0}, n0 = 1000, nominalInletPressure(displayUnit = "Pa") = 50000, nominalMassFlowRate = 100, nominalOutletPressure(displayUnit = "Pa") = 3000000, q_nom = {0, 0.055, 0.1}, rho0(displayUnit = "g/cm3") = 1000) annotation(
    Placement(visible = true, transformation(origin = {45, -17}, extent = {{-7, 7}, {7, -7}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{6, 20}, {-14, 40}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1131.6) annotation(
    Placement(visible = true, transformation(origin = {40, 18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola steamTurbineStodola2(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {64, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed2(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{90, 96}, {70, 116}}, rotation = 0)));
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-138, 102}, extent = {{8, 8}, {-8, -8}}, rotation = 0)));
  inner Modelica.Fluid.System system2 annotation(
    Placement(visible = true, transformation(origin = {-166, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkPressure sinkPressure annotation(
    Placement(visible = true, transformation(origin = {138, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_conc(k = 15) annotation(
    Placement(visible = true, transformation(origin = {102, 104}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ThermoPower.Water.SourceW Potable_source annotation(
    Placement(visible = true, transformation(origin = {148, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.Tank tank(A = 1, V0 = 1, allowFlowReversal = false, y(start = 0.1), y0 = 1, ystart = 0.1) annotation(
    Placement(visible = true, transformation(origin = {46, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.SensW sensW2 annotation(
    Placement(visible = true, transformation(origin = {2, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkW Potable_sink annotation(
    Placement(visible = true, transformation(origin = {-20, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy (redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {80, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1 (redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {-44, -59}, extent = {{9, 8}, {-9, -8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput enthalpy_flow annotation(
    Placement(visible = true, transformation(origin = {188, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SensW sensW1 annotation(
    Placement(visible = true, transformation(origin = {95, -11}, extent = {{-9, -9}, {9, 9}}, rotation = -90)));
  ThermoPower.Water.SourceW feedback_source annotation(
    Placement(visible = true, transformation(origin = {-22, -34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ThermoPower.Water.SensT sensT1 annotation(
    Placement(visible = true, transformation(origin = {104, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  desal_with_controller desalination_plant annotation(
    Placement(visible = true, transformation(origin = {161, 19}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_temp(k = 20) annotation(
    Placement(visible = true, transformation(origin = {102, 66}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_temp(k = 110) annotation(
    Placement(visible = true, transformation(origin = {100, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add adder annotation(
    Placement(visible = true, transformation(origin = {146, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.ExpSine distillate_demand(amplitude = 300, damping = 1, freqHz = 0.1, offset = 90, startTime = 3000)  annotation(
    Placement(visible = true, transformation(origin = {102, 40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(constantSpeed.flange, steamTurbineStodola.shaft_b) annotation(
    Line(points = {{-58, 28}, {-58, 70}}));
  connect(sensW.outlet, steamTurbineStodola.inlet) annotation(
    Line(points = {{-72, 50}, {-72, 78}}, color = {0, 0, 255}));
  connect(evaporator.heatPort, furnace.port) annotation(
    Line(points = {{-146, 2}, {-146, -35.5}, {-88, -35.5}, {-88, -57}}, color = {191, 0, 0}));
  connect(evaporator.port_b, sensT.inlet) annotation(
    Line(points = {{-136, 12}, {-72, 12}}, color = {0, 127, 255}));
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
    Line(points = {{-16, 78}, {18, 78}, {18, 42}}, color = {0, 0, 255}));
  connect(const.y, prescribedSpeedPump.nPump) annotation(
    Line(points = {{47, 18}, {50, 18}, {50, -13}}, color = {0, 0, 127}));
  connect(condenserPreP1.waterOut, prescribedSpeedPump.inlet) annotation(
    Line(points = {{38, 42}, {52, 42}, {52, -17}}, color = {0, 0, 255}));
  connect(prescribedSpeedPump.outlet, evaporator.port_a) annotation(
    Line(points = {{38, -17}, {-156, -17}, {-156, 12}}, color = {0, 0, 255}));
  connect(evaporator.port_b, steamTurbineStodola2.inlet) annotation(
    Line(points = {{-136, 12}, {-136, 86}, {56, 86}, {56, 80}}, color = {0, 127, 255}));
  connect(steamTurbineStodola2.shaft_b, constantSpeed2.flange) annotation(
    Line(points = {{70, 72}, {70, 106}}));
  connect(Potable_source.flange, tank.inlet) annotation(
    Line(points = {{138, -58}, {54, -58}}, color = {0, 0, 255}));
  connect(tank.outlet, sensW2.inlet) annotation(
    Line(points = {{38, -58}, {23, -58}, {23, -50}, {8, -50}}, color = {0, 0, 255}));
  connect(sensW2.outlet, Potable_sink.flange) annotation(
    Line(points = {{-4, -50}, {-10, -50}, {-10, -76}}, color = {0, 0, 255}));
  connect(steamTurbineStodola2.outlet, specificEnthalpy.port) annotation(
    Line(points = {{72, 80}, {90, 80}, {90, 20}}, color = {0, 0, 255}));
  connect(specificEnthalpy1.h_out, enthalpy_flow) annotation(
    Line(points = {{-54, -59}, {-54, -90}, {188, -90}}, color = {0, 0, 127}));
  connect(specificEnthalpy1.port, evaporator.port_a) annotation(
    Line(points = {{-44, -51}, {-44, -25.5}, {-156, -25.5}, {-156, 12}}));
  connect(feedback_source.flange, specificEnthalpy1.port) annotation(
    Line(points = {{-32, -34}, {-44, -34}, {-44, -51}}, color = {0, 0, 255}));
  connect(specificEnthalpy.port, sensW1.inlet) annotation(
    Line(points = {{90, 20}, {91, 20}, {91, -6}}, color = {0, 127, 255}));
  connect(sinkPressure.flange, sensT1.outlet) annotation(
    Line(points = {{128, -106}, {110, -106}}, color = {0, 0, 255}));
  connect(sensT1.inlet, sensW1.outlet) annotation(
    Line(points = {{98, -106}, {91, -106}, {91, -16}}, color = {0, 0, 255}));
  connect(desalination_plant.distillate_output, Potable_source.in_w0) annotation(
    Line(points = {{172, 34}, {192, 34}, {192, -30}, {186, -30}, {186, -43}, {152, -43}, {152, -52}}, color = {0, 0, 127}));
  connect(seawater_conc.y, desalination_plant.seawater_conc) annotation(
    Line(points = {{109, 104}, {116, 104}, {116, 36}, {142, 36}}, color = {0, 0, 127}));
  connect(sensW1.w, desalination_plant.steam_flowrate) annotation(
    Line(points = {{100, -18}, {112, -18}, {112, 7}, {143, 7}}, color = {0, 0, 127}));
  connect(seawater_temp.y, desalination_plant.seawater_temp) annotation(
    Line(points = {{108, 66}, {114, 66}, {114, 29}, {143, 29}}, color = {0, 0, 127}));
  connect(steam_temp.y, desalination_plant.steam_temp) annotation(
    Line(points = {{106, 12}, {124.5, 12}, {124.5, 14}, {143, 14}}, color = {0, 0, 127}));
  connect(desalination_plant.distillate_output, Potable_sink.in_w0) annotation(
    Line(points = {{172, 34}, {192, 34}, {192, -46}, {-16, -46}, {-16, -70}}, color = {0, 0, 127}));
  connect(desalination_plant.condensed_steam, adder.u2) annotation(
    Line(points = {{172, 14}, {178, 14}, {178, -28}, {158, -28}}, color = {0, 0, 127}));
  connect(desalination_plant.reject_steam, adder.u1) annotation(
    Line(points = {{172, 7.5}, {168, 7.5}, {168, -16}, {158, -16}}, color = {0, 0, 127}));
  connect(adder.y, feedback_source.in_w0) annotation(
    Line(points = {{136, -22}, {-18, -22}, {-18, -28}}, color = {0, 0, 127}));
  connect(distillate_demand.y, desalination_plant.distillate_demand) annotation(
    Line(points = {{108, 40}, {128, 40}, {128, 22}, {142, 22}}, color = {0, 0, 127}));
protected
  annotation(
    uses(ThermoPower(version = "3.1"), Modelica(version = "3.2.3")),
  Diagram(coordinateSystem(extent = {{-180, 120}, {220, -120}})),
  version = "");
end desalfull;
