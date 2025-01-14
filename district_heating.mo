model district_heating



replaceable package Water = ThermoPower.Water.StandardWater constrainedby Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
  ThermoPower.Water.SteamTurbineStodola Turbine_2(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-180, 56}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola Turbine_1(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-270, 58}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(
    Placement(visible = true, transformation(origin = {-541, -76}, extent = {{-29, -29}, {29, 29}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed r1(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(origin = {-206, -12}, extent = {{12, -12}, {-12, 12}}, rotation = 0)));
  ThermoPower.Water.SensT sensT annotation(
    Placement(visible = true, transformation(origin = {-375, 63}, extent = {{-33, -33}, {33, 33}}, rotation = 90)));
  ThermoPower.Water.SensW sensW annotation(
    Placement(visible = true, transformation(origin = {-331, 163}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1e6) annotation(
    Placement(visible = true, transformation(origin = {-614.273, -164.8}, extent = {{-16.8182, -18.5001}, {16.8182, 18.5001}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable q_F_Tab(table = [0, 0; 3600, 400; 7210, 400]) annotation(
    Placement(visible = true, transformation(origin = {-746, -166}, extent = {{-42, -42}, {42, 42}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(V_l_start = 0.1, V_t = 10, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 300e3, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start = 1000000) annotation(
    Placement(visible = true, transformation(origin = {-541, 7}, extent = {{-37, -21}, {37, 21}}, rotation = 0)));
  ThermoPower.PowerPlants.SteamTurbineGroup.Components.CondenserPreP condenserPreP1(p(displayUnit = "Pa") = 5389.2) annotation(
    Placement(visible = true, transformation(origin = {-62, 82}, extent = {{-34, -34}, {34, 34}}, rotation = 90)));
  ThermoPower.Examples.RankineCycle.Models.PrescribedSpeedPump pump(redeclare package FluidMedium = Water, SSInit = false, head_nom = {450, 300, 0}, n0 = 1000, nominalInletPressure(displayUnit = "Pa") = 50000, nominalMassFlowRate = 100, nominalOutletPressure(displayUnit = "Pa") = 3000000, q_nom = {0, 0.055, 0.1}, rho0(displayUnit = "g/cm3") = 1000) annotation(
    Placement(visible = true, transformation(origin = {-45, -133}, extent = {{-29, 29}, {29, -29}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed r2(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(extent = {{-118, -24}, {-138, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant k1(k = 1131.6) annotation(
    Placement(visible = true, transformation(origin = {-74, -58}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  ThermoPower.Water.SteamTurbineStodola Turbine_3(Kt = 0.0104, PRstart = 10, phi(displayUnit = "rad"), pnom = 5389.2, wnom = 55, wstart = 55) annotation(
    Placement(visible = true, transformation(origin = {-151, 315}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed r3(w_fixed = 3000 / 60 * 3.14159) annotation(
    Placement(visible = true, transformation(origin = {-60, 250}, extent = {{18, -18}, {-18, 18}}, rotation = 0)));
  inner ThermoPower.System system annotation(
    Placement(visible = true, transformation(origin = {-762, 138}, extent = {{8, 8}, {-8, -8}}, rotation = 0)));
  inner Modelica.Fluid.System system2 annotation(
    Placement(visible = true, transformation(origin = {-760, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SinkPressure sinkPressure annotation(
    Placement(visible = true, transformation(origin = {583, -729}, extent = {{-63, -63}, {63, 63}}, rotation = 0)));
  ThermoPower.Water.SourceW Potable_source annotation(
    Placement(visible = true, transformation(origin = {791, -576}, extent = {{53, -53}, {-53, 53}}, rotation = 0)));
  ThermoPower.Water.Tank tank(A = 1, V0 = 1, allowFlowReversal = false, y(start = 0.1), y0 = 1, ystart = 0.1) annotation(
    Placement(visible = true, transformation(origin = {640, -544}, extent = {{52, -52}, {-52, 52}}, rotation = 0)));
  ThermoPower.Water.SensW sensW2 annotation(
    Placement(visible = true, transformation(origin = {483, -553}, extent = {{55, -55}, {-55, 55}}, rotation = 0)));
  ThermoPower.Water.SinkW Potable_sink annotation(
    Placement(visible = true, transformation(origin = {322, -574}, extent = {{60, -60}, {-60, 60}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy h_sensor(redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {14, 181}, extent = {{-27, 28}, {27, -28}}, rotation = -90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy sensor_h1(redeclare package Medium = Water) annotation(
    Placement(visible = true, transformation(origin = {-399, -449}, extent = {{32, 22}, {-32, -22}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput enthalpy_flow annotation(
    Placement(visible = true, transformation(origin = {-318, -512}, extent = {{-24, -24}, {24, 24}}, rotation = 0), iconTransformation(origin = {98, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoPower.Water.SensW sensW1 annotation(
    Placement(visible = true, transformation(origin = {56, -250}, extent = {{-34, -34}, {34, 34}}, rotation = -90)));
  ThermoPower.Water.SourceW feedback_source annotation(
    Placement(visible = true, transformation(origin = {-63, -425}, extent = {{73, -73}, {-73, 73}}, rotation = 0)));
  ThermoPower.Water.SensT sensT1 annotation(
    Placement(visible = true, transformation(origin = {173, -715}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
  desal_with_controller desalination_plant annotation(
    Placement(visible = true, transformation(origin = {552, 34}, extent = {{-252, -252}, {252, 252}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_temp(k = 110) annotation(
    Placement(visible = true, transformation(origin = {171, -141}, extent = {{-57, -57}, {57, 57}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_temp(k = 20) annotation(
    Placement(visible = true, transformation(origin = {174, 198}, extent = {{-54, -54}, {54, 54}}, rotation = 0)));
  Modelica.Blocks.Math.Add adder annotation(
    Placement(visible = true, transformation(origin = {632, -318}, extent = {{48, 48}, {-48, -48}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant distillate_demand(k = 50) annotation(
    Placement(visible = true, transformation(origin = {172, 46}, extent = {{-52, -52}, {52, 52}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_conc(k = 15) annotation(
    Placement(visible = true, transformation(origin = {168, 366}, extent = {{-52, -52}, {52, 52}}, rotation = 0)));
  ThermoPower.Water.SensT sensT2 annotation(
    Placement(visible = true, transformation(origin = {53, 85}, extent = {{33, 33}, {-33, -33}}, rotation = 90)));
equation
  connect(r1.flange, Turbine_1.shaft_b) annotation(
    Line(points = {{-218, -12}, {-218, 40.5}, {-250, 40.5}, {-250, 58}}));
  connect(evaporator.heatPort, furnace.port) annotation(
    Line(points = {{-541, -14}, {-541, -47}}, color = {191, 0, 0}));
  connect(Turbine_1.outlet, Turbine_2.inlet) annotation(
    Line(points = {{-244, 84}, {-220, 84}, {-220, 82}, {-206, 82}}, color = {0, 0, 255}));
  connect(q_F_Tab.y, gain.u) annotation(
    Line(points = {{-700, -166}, {-674.5, -166}, {-674.5, -165}, {-634, -165}}, color = {0, 0, 127}));
  connect(Turbine_2.shaft_b, r2.flange) annotation(
    Line(points = {{-160, 56}, {-138, 56}, {-138, -14}}));
  connect(Turbine_2.outlet, condenserPreP1.steamIn) annotation(
    Line(points = {{-154, 82}, {-96, 82}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(k1.y, pump.nPump) annotation(
    Line(points = {{-43, -58}, {-24, -58}, {-24, -116}}, color = {0, 0, 127}));
  connect(Turbine_3.shaft_b, r3.flange) annotation(
    Line(points = {{-127, 315}, {-78, 315}, {-78, 250}}));
  connect(Potable_source.flange, tank.inlet) annotation(
    Line(points = {{738, -576}, {709, -576}, {709, -575}, {682, -575}}, color = {170, 85, 255}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(tank.outlet, sensW2.inlet) annotation(
    Line(points = {{598, -575}, {516, -575}}, color = {170, 85, 255}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(Turbine_3.outlet, h_sensor.port) annotation(
    Line(points = {{-121, 345}, {42, 345}, {42, 181}}, color = {0, 170, 255}));
  connect(sensor_h1.h_out, enthalpy_flow) annotation(
    Line(points = {{-434, -449}, {-442, -449}, {-442, -512}, {-318, -512}}, color = {0, 170, 255}));
  connect(feedback_source.flange, sensor_h1.port) annotation(
    Line(points = {{-136, -425}, {-265.5, -425}, {-265.5, -427}, {-399, -427}}, color = {0, 170, 255}));
  connect(sensW1.outlet, sensT1.inlet) annotation(
    Line(points = {{42, -270}, {42, -730}, {151, -730}}, color = {85, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(gain.y, furnace.Q_flow) annotation(
    Line(points = {{-596, -165}, {-540, -165}, {-540, -104}}, color = {0, 0, 127}));
  connect(sensor_h1.port, evaporator.port_a) annotation(
    Line(points = {{-399, -427}, {-674, -427}, {-674, 8}, {-578, 8}}, color = {0, 127, 255}));
  connect(pump.outlet, evaporator.port_a) annotation(
    Line(points = {{-74, -133}, {-652, -133}, {-652, 8}, {-578, 8}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(evaporator.port_b, sensT.inlet) annotation(
    Line(points = {{-504, 8}, {-362, 8}, {-362, 44}}, color = {0, 127, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(sensT.outlet, sensW.inlet) annotation(
    Line(points = {{-362, 82}, {-362, 111}, {-360, 111}, {-360, 144}}, color = {0, 0, 255}));
  connect(sensW.outlet, Turbine_1.inlet) annotation(
    Line(points = {{-302, 144}, {-296, 144}, {-296, 84}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(evaporator.port_b, Turbine_3.inlet) annotation(
    Line(points = {{-504, 8}, {-436, 8}, {-436, 344}, {-180, 344}}, color = {0, 127, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(sensT1.outlet, sinkPressure.flange) annotation(
    Line(points = {{195, -730}, {234.5, -730}, {234.5, -729}, {520, -729}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(condenserPreP1.waterOut, pump.inlet) annotation(
    Line(points = {{-28, 82}, {18, 82}, {18, -133}, {-16, -133}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(adder.y, feedback_source.in_w0) annotation(
    Line(points = {{579, -318}, {-34, -318}, {-34, -381}}, color = {0, 0, 127}));
  connect(sensW1.w, desalination_plant.steam_flowrate) annotation(
    Line(points = {{76, -277}, {296, -277}, {296, -102}, {350, -102}}, color = {0, 0, 127}));
  connect(steam_temp.y, desalination_plant.steam_temp) annotation(
    Line(points = {{234, -141}, {252, -141}, {252, -21}, {350, -21}}, color = {0, 0, 127}));
  connect(distillate_demand.y, desalination_plant.distillate_demand) annotation(
    Line(points = {{229, 46}, {325.5, 46}, {325.5, 59}, {350, 59}}, color = {0, 0, 127}));
  connect(seawater_temp.y, desalination_plant.seawater_temp) annotation(
    Line(points = {{233, 198}, {268, 198}, {268, 140}, {350, 140}}, color = {0, 0, 127}));
  connect(seawater_conc.y, desalination_plant.seawater_conc) annotation(
    Line(points = {{225, 366}, {300, 366}, {300, 218}, {348, 218}}, color = {0, 0, 127}));
  connect(desalination_plant.reject_steam, adder.u2) annotation(
    Line(points = {{673, -92}, {712, -92}, {712, -289}, {690, -289}}, color = {0, 0, 127}));
  connect(desalination_plant.condensed_steam, adder.u1) annotation(
    Line(points = {{673, -21}, {734, -21}, {734, -347}, {690, -347}}, color = {0, 0, 127}));
  connect(desalination_plant.distillate_output, Potable_source.in_w0) annotation(
    Line(points = {{673, 200}, {812, 200}, {812, -544}}, color = {0, 0, 127}));
  connect(sensW2.outlet, Potable_sink.flange) annotation(
    Line(points = {{450, -574}, {382, -574}}, color = {170, 85, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
  connect(desalination_plant.distillate_output, Potable_sink.in_w0) annotation(
    Line(points = {{673, 200}, {814, 200}, {814, -472}, {346, -472}, {346, -538}}, color = {0, 0, 127}));
  connect(h_sensor.port, sensT2.inlet) annotation(
    Line(points = {{42, 182}, {42, 146}, {40, 146}, {40, 104}}, color = {0, 127, 255}));
  connect(sensT2.outlet, sensW1.inlet) annotation(
    Line(points = {{40, 66}, {42, 66}, {42, -230}}, color = {0, 170, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20));
protected
  annotation(
    uses(ThermoPower(version = "3.1"), Modelica(version = "3.2.3")),
  Diagram(coordinateSystem(extent = {{-800, 460}, {860, -800}})),
  version = "");





end district_heating;
