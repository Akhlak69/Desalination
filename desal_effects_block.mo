model desal_effects_block
  second_effect effect_2 annotation(
    Placement(visible = true, transformation(origin = {-50, 58}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  third_effect effect_3 annotation(
    Placement(visible = true, transformation(origin = {-16, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  fourth_effect effect_4 annotation(
    Placement(visible = true, transformation(origin = {18, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  last_effect effect_5 annotation(
    Placement(visible = true, transformation(origin = {54, 58}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  distillate_block total_distillate annotation(
    Placement(visible = true, transformation(origin = {100.942, -85.62}, extent = {{-11.2446, 34.3585}, {11.2446, 109.947}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T_in_steam annotation(
    Placement(visible = true, transformation(origin = {-236, 108}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-122, -108}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput steam_w annotation(
    Placement(visible = true, transformation(origin = {-232, 48}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_conc annotation(
    Placement(visible = true, transformation(origin = {-232, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-122, 118}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  first_effect effect_1 annotation(
    Placement(visible = true, transformation(origin = {-123, 53}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput condensed_steam annotation(
    Placement(visible = true, transformation(origin = {-122, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-32, 10}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_T annotation(
    Placement(visible = true, transformation(origin = {158, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput seawater_w annotation(
    Placement(visible = true, transformation(origin = {142, 30}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-120, 34}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput distillate annotation(
    Placement(visible = true, transformation(origin = {140, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-32, -46}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput final_brine_conc annotation(
    Placement(visible = true, transformation(origin = {112, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-36, 102}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
equation
  connect(effect_2.steam_sea_out1, effect_2.steam_sea_in2) annotation(
    Line(points = {{-48, 61}, {-46, 61}, {-46, 49}}, color = {0, 0, 127}));
  connect(effect_2.steam_next_effect1, effect_3.steam_next_effect1) annotation(
    Line(points = {{-48, 78}, {-30, 78}}, color = {0, 0, 127}));
  connect(effect_2.brine_conc2, effect_3.brine_conc2) annotation(
    Line(points = {{-48, 74}, {-30, 74}, {-30, 72}}, color = {0, 0, 127}));
  connect(effect_2.brine_mass_flow1, effect_3.brine_mass_flow1) annotation(
    Line(points = {{-48, 70}, {-36, 70}, {-36, 66}, {-30, 66}}, color = {0, 0, 127}));
  connect(effect_3.steam_next_effect2, effect_4.steam_next_effect2) annotation(
    Line(points = {{-14, 78}, {4, 78}}, color = {0, 0, 127}));
  connect(effect_3.brine_conc3, effect_4.brine_conc3) annotation(
    Line(points = {{-14, 74}, {4, 74}}, color = {0, 0, 127}));
  connect(effect_3.brine_mass_flow2, effect_4.brine_mass_flow2) annotation(
    Line(points = {{-14, 70}, {-5, 70}, {-5, 69}, {4, 69}}, color = {0, 0, 127}));
  connect(effect_3.steam_sea_out2, effect_3.steam_sea_in3) annotation(
    Line(points = {{-14, 64}, {-6, 64}, {-6, 52}, {-10, 52}}, color = {0, 0, 127}));
  connect(effect_4.seawater_mass_flow_out, effect_3.sea_water_mass_flow1) annotation(
    Line(points = {{1, 49}, {-2, 49}, {-2, 44}, {-10, 44}}, color = {0, 0, 127}));
  connect(effect_4.steam_sea_out3, effect_4.steam_sea_in4) annotation(
    Line(points = {{16, 66}, {20, 66}, {20, 54}, {14, 54}}, color = {0, 0, 127}));
  connect(effect_5.seawater_mass_flow_out, effect_4.seawater_mass_flow1) annotation(
    Line(points = {{36, 46}, {25, 46}, {25, 45}, {14, 45}}, color = {0, 0, 127}));
  connect(effect_5.sea_water_mass_flow1, effect_5.seawater_mass_flow1) annotation(
    Line(points = {{62, 56}, {58, 56}, {58, 42}, {50, 42}}, color = {0, 0, 127}));
  connect(effect_4.steam_next_effect3, effect_5.steam_next_effect3) annotation(
    Line(points = {{16, 81}, {40, 81}, {40, 78}}, color = {0, 0, 127}));
  connect(effect_4.brine_conc4, effect_5.brine_conc4) annotation(
    Line(points = {{15, 77}, {32, 77}, {32, 72}, {40, 72}}, color = {0, 0, 127}));
  connect(effect_4.brine_mass_flow3, effect_5.brine_mass_flow3) annotation(
    Line(points = {{16, 74}, {26, 74}, {26, 68}, {40, 68}}, color = {0, 0, 127}));
  connect(effect_5.steam_next_effect4, effect_5.steam_next_effect5) annotation(
    Line(points = {{52, 78}, {84, 78}, {84, 68}, {76, 68}}, color = {0, 0, 127}));
  connect(effect_5.steam_sea_out_last, effect_5.steam_sea_in5) annotation(
    Line(points = {{52, 66}, {54, 66}, {54, 50}, {48, 50}}, color = {0, 0, 127}));
  connect(effect_3.seawater_mass_flow_out1, effect_2.sea_water_mass_flow1) annotation(
    Line(points = {{-24, 48}, {-30, 48}, {-30, 40}, {-46, 40}}, color = {0, 0, 127}));
  connect(effect_2.sea_water_distillate, total_distillate.distillate_2) annotation(
    Line(points = {{-47, 65}, {-38, 65}, {-38, -9}, {96, -9}}, color = {0, 0, 127}));
  connect(effect_2.distillate_second_effect, total_distillate.distillate_3) annotation(
    Line(points = {{-46, 44}, {-36, 44}, {-36, -17}, {96, -17}}, color = {0, 0, 127}));
  connect(effect_3.sea_water_distillate2, total_distillate.distillate_4) annotation(
    Line(points = {{-14, 68}, {-4, 68}, {-4, -25}, {96, -25}}, color = {0, 0, 127}));
  connect(effect_3.distillate_third_effect, total_distillate.distillate_5) annotation(
    Line(points = {{-10, 48}, {-6, 48}, {-6, -34}, {96, -34}}, color = {0, 0, 127}));
  connect(effect_4.sea_water_distillate4, total_distillate.distillate_6) annotation(
    Line(points = {{16, 71}, {24, 71}, {24, -42}, {96, -42}}, color = {0, 0, 127}));
  connect(effect_4.distillate_fourth_effect, total_distillate.distillate_7) annotation(
    Line(points = {{14, 49}, {30, 49}, {30, -50}, {96, -50}}, color = {0, 0, 127}));
  connect(effect_5.sea_water_distillate_last, total_distillate.distillate_8) annotation(
    Line(points = {{52, 70}, {56, 70}, {56, -59}, {96, -59}}, color = {0, 0, 127}));
  connect(effect_5.distillate_last_effect, total_distillate.distillate_9) annotation(
    Line(points = {{50, 46}, {54, 46}, {54, -67}, {96, -67}}, color = {0, 0, 127}));
  connect(effect_5.distillate_condenser, total_distillate.distillate_10) annotation(
    Line(points = {{62, 66}, {60, 66}, {60, -75}, {96, -75}}, color = {0, 0, 127}));
  connect(effect_1.seawater_mass_flow_out3, effect_1.seawater_in) annotation(
    Line(points = {{-126, 40}, {-154, 40}, {-154, 66}, {-134, 66}}, color = {0, 0, 127}));
  connect(T_in_steam, effect_1.Tin_steam) annotation(
    Line(points = {{-236, 108}, {-158, 108}, {-158, 80}, {-134, 80}}, color = {0, 0, 127}));
  connect(steam_w, effect_1.heat_steam_in) annotation(
    Line(points = {{-232, 48}, {-166, 48}, {-166, 72}, {-134, 72}}, color = {0, 0, 127}));
  connect(seawater_conc, effect_1.seawater_conc) annotation(
    Line(points = {{-232, -10}, {-146, -10}, {-146, 50}, {-134, 50}}, color = {0, 0, 127}));
  connect(effect_1.steam_next_effect, effect_2.steam_next_effect) annotation(
    Line(points = {{-104, 78}, {-72, 78}}, color = {0, 0, 127}));
  connect(effect_1.brine_conc1, effect_2.brine_conc1) annotation(
    Line(points = {{-104, 72}, {-72, 72}}, color = {0, 0, 127}));
  connect(effect_1.brine_mass_flow, effect_2.brine_mass_flow) annotation(
    Line(points = {{-104, 66}, {-72, 66}}, color = {0, 0, 127}));
  connect(effect_1.steam_sea_out, effect_1.steam_sea_in) annotation(
    Line(points = {{-104, 58}, {-98, 58}, {-98, 46}, {-106, 46}}, color = {0, 0, 127}));
  connect(effect_2.seawater_mass_flow_out2, effect_1.seawater_mass_flow1) annotation(
    Line(points = {{-64, 44}, {-86, 44}, {-86, 36}, {-106, 36}}, color = {0, 0, 127}));
  connect(effect_1.distillate_first_effect, total_distillate.distillate_1) annotation(
    Line(points = {{-106, 40}, {-92, 40}, {-92, -2}, {96, -2}}, color = {0, 0, 127}));
  connect(effect_1.condensed_steam, condensed_steam) annotation(
    Line(points = {{-134, 60}, {-160, 60}, {-160, -54}, {-122, -54}}, color = {0, 0, 127}));
  connect(seawater_T, effect_5.seawater_T_in) annotation(
    Line(points = {{158, 120}, {188, 120}, {188, 54}, {76, 54}}, color = {0, 0, 127}));
  connect(seawater_w, effect_5.seawater_mass_in) annotation(
    Line(points = {{142, 30}, {84, 30}, {84, 50}, {76, 50}}, color = {0, 0, 127}));
  connect(total_distillate.total_distillate, distillate) annotation(
    Line(points = {{108, -37}, {124, -37}, {124, -36}, {140, -36}}, color = {0, 0, 127}));
  connect(effect_5.final_brine_conc, final_brine_conc) annotation(
    Line(points = {{52, 82}, {74, 82}, {74, 104}, {112, 104}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-260, 140}, {200, -80}})),
    version = "",
  Icon(coordinateSystem(extent = {{-160, 120}, {260, -120}}), graphics = {Rectangle(origin = {-77, 1}, lineThickness = 2, extent = {{-23, 121}, {23, -121}}), Text(origin = {-77, 68}, lineThickness = 1, extent = {{131, 188}, {-131, -188}}, textString = "Desal block", fontSize = 4)}));

end desal_effects_block;
