//! base 0.1.0
package 'SimpleFilter'
  model 'SimpleFilter' "First-order low-pass filter"
    parameter Real 'T'(min = 0.0, unit = "s") = 0.1 "Time constant";
    input Real 'u' "Input signal";
    output Real 'y'(fixed = true, start = 0.0, unit = "1") "Output signal";
  equation
    'T' * der('y') = 'u' - 'y';
    annotation(experiment(StopTime = 10.0, Interval = 0.01));
  end 'SimpleFilter';
end 'SimpleFilter';
