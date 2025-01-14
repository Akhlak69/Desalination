model desal_effects_2
  first_effect effect_1 annotation(
    Placement(visible = true, transformation(origin = {-112, 48}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  second_effect effect_2 annotation(
    Placement(visible = true, transformation(origin = {-50, 58}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  third_effect effect_3 annotation(
    Placement(visible = true, transformation(origin = {-16, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  fourth_effect effect_4 annotation(
    Placement(visible = true, transformation(origin = {18, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  last_effect effect_5 annotation(
    Placement(visible = true, transformation(origin = {54, 58}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_temp(k = 110)  annotation(
    Placement(visible = true, transformation(origin = {-184, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant steam_flowrate(k = 6.2)  annotation(
    Placement(visible = true, transformation(origin = {-184, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_conc(k = 15)  annotation(
    Placement(visible = true, transformation(origin = {-184, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_temp(k = 20) annotation(
    Placement(visible = true, transformation(origin = {124, 58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  distillate_block total_distillate annotation(
    Placement(visible = true, transformation(origin = {104.942, -81.62}, extent = {{-11.2446, 34.3585}, {11.2446, 109.947}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant seawater_flow_rate(k = 270) annotation(
    Placement(visible = true, transformation(origin = {125, 25}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
equation
  connect(effect_1.steam_next_effect, effect_2.steam_next_effect) annotation(
    Line(points = {{-90, 76}, {-82, 76}, {-82, 78}, {-72, 78}}, color = {0, 0, 127}));
  connect(effect_1.brine_conc1, effect_2.brine_conc1) annotation(
    Line(points = {{-90, 68}, {-80, 68}, {-80, 72}, {-72, 72}}, color = {0, 0, 127}));
  connect(effect_1.brine_mass_flow, effect_2.brine_mass_flow) annotation(
    Line(points = {{-90, 62}, {-80, 62}, {-80, 66}, {-72, 66}}, color = {0, 0, 127}));
  connect(effect_1.steam_sea_out, effect_1.steam_sea_in) annotation(
    Line(points = {{-90, 54}, {-84, 54}, {-84, 40}, {-94, 40}}, color = {0, 0, 127}));
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
  connect(effect_2.seawater_mass_flow_out2, effect_1.seawater_mass_flow1) annotation(
    Line(points = {{-64, 44}, {-76, 44}, {-76, 28}, {-92, 28}}, color = {0, 0, 127}));
  connect(effect_1.seawater_mass_flow_out3, effect_1.seawater_in) annotation(
    Line(points = {{-114, 34}, {-140, 34}, {-140, 58}, {-124, 58}}, color = {0, 0, 127}));
  connect(steam_temp.y, effect_1.Tin_steam) annotation(
    Line(points = {{-172, 82}, {-132, 82}, {-132, 74}, {-124, 74}}, color = {0, 0, 127}));
  connect(steam_flowrate.y, effect_1.heat_steam_in) annotation(
    Line(points = {{-173, 52}, {-162, 52}, {-162, 68}, {-124, 68}}, color = {0, 0, 127}));
  connect(seawater_conc.y, effect_1.seawater_conc) annotation(
    Line(points = {{-173, 20}, {-156, 20}, {-156, 46}, {-124, 46}}, color = {0, 0, 127}));
  connect(seawater_temp.y, effect_5.seawater_T_in) annotation(
    Line(points = {{113, 58}, {76, 58}, {76, 54}}, color = {0, 0, 127}));
  connect(effect_5.steam_sea_out_last, effect_5.steam_sea_in5) annotation(
    Line(points = {{52, 66}, {54, 66}, {54, 50}, {48, 50}}, color = {0, 0, 127}));
  connect(effect_3.seawater_mass_flow_out1, effect_2.sea_water_mass_flow1) annotation(
    Line(points = {{-24, 48}, {-30, 48}, {-30, 40}, {-46, 40}}, color = {0, 0, 127}));
  connect(effect_1.distillate_first_effect, total_distillate.distillate_1) annotation(
    Line(points = {{-94, 34}, {-66, 34}, {-66, 2}, {98, 2}}, color = {0, 0, 127}));
  connect(effect_2.sea_water_distillate, total_distillate.distillate_2) annotation(
    Line(points = {{-47, 65}, {-38, 65}, {-38, -5}, {98, -5}}, color = {0, 0, 127}));
  connect(effect_2.distillate_second_effect, total_distillate.distillate_3) annotation(
    Line(points = {{-46, 44}, {-36, 44}, {-36, -13}, {98, -13}}, color = {0, 0, 127}));
  connect(effect_3.sea_water_distillate2, total_distillate.distillate_4) annotation(
    Line(points = {{-14, 68}, {-4, 68}, {-4, -21}, {98, -21}}, color = {0, 0, 127}));
  connect(effect_3.distillate_third_effect, total_distillate.distillate_5) annotation(
    Line(points = {{-10, 48}, {-6, 48}, {-6, -30}, {98, -30}}, color = {0, 0, 127}));
  connect(effect_4.sea_water_distillate4, total_distillate.distillate_6) annotation(
    Line(points = {{16, 71}, {24, 71}, {24, -38}, {98, -38}}, color = {0, 0, 127}));
  connect(effect_4.distillate_fourth_effect, total_distillate.distillate_7) annotation(
    Line(points = {{14, 49}, {30, 49}, {30, -46}, {98, -46}}, color = {0, 0, 127}));
  connect(effect_5.sea_water_distillate_last, total_distillate.distillate_8) annotation(
    Line(points = {{52, 70}, {56, 70}, {56, -55}, {98, -55}}, color = {0, 0, 127}));
  connect(effect_5.distillate_last_effect, total_distillate.distillate_9) annotation(
    Line(points = {{50, 46}, {54, 46}, {54, -63}, {98, -63}}, color = {0, 0, 127}));
  connect(effect_5.distillate_condenser, total_distillate.distillate_10) annotation(
    Line(points = {{62, 66}, {60, 66}, {60, -71}, {98, -71}}, color = {0, 0, 127}));
  connect(seawater_flow_rate.y, effect_5.seawater_mass_in) annotation(
    Line(points = {{115, 25}, {90, 25}, {90, 50}, {76, 50}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-200, 100}, {140, -80}})),
    version = "");
end desal_effects_2;
