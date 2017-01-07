%% MLspike
% 
% <<thumbnail300x200.png>>
% 
% MLspike_ is an algorithm to reconstruct neuronal spiking activity from
% noisy calcium recordings. Its description and benchmarking can be found
% in <http://www.nature.com/articles/ncomms12190 (Deneux et al. 2016)>.
%
%% Overview
% Main functions are:
%
% <html><table>
% <tr><td> tps_mlspikes         <td> estimate spikes from calcium (note the function spk_est, which is a small wrapper of tps_mlspikes)
% <tr><td> spk_autocalibration  <td> auto-calibration of parameters A, tau, sigma
% <tr><td> spk_autosigma        <td> auto-calibration of parameter sigma
% <tr><td> spk_gentrain         <td> generate simulated spike train
% <tr><td> spk_calcium          <td> generate simulated calcium signal
% <tr><td> spk_display          <td> display spikes and calcium signals together
% <tr><td> spk_calibration      <td> calibration, i.e. estimate the values of physiological parameters based on true spikes and recorded calcium signals
% </table></html>
%
% Simulation and estimation run with parameters, default parameters are easily obtained, for example: 
%
%   par = tps_mlspikes('par');`.

%%
% Help for each function can be provided by typing `help function_name`.
% Additional help can be found in the Help browser: type `doc`, then go to
% 'Supplemental Software' > 'MLspike Toolbox'.
%
%% Demo
% Two demos exist:
% 
% *<matlab:edit('spk_demoGUI') spk_demoGUI>*
% This script runs MLspike (but not the autocalibration) on 
% simulated data, with a graphic interface that lets user play with
% the simulation and estimation parameters.
% It provides an immediate understanding of MLspike abilities, and
% of how does estimation accuracy depend on the characteristics of
% the data and on estimation parameters.
%
% *<matlab:edit('spk_demo') spk_demo>*
% This script generates simulated data and runs successively the
% MLspike and autocalibration algorithms on it; use it to learn how to
% use the different functions; comments in the code indicate how to
% replace the simulated data by your own data.
% <spk_demo.html See here the script output.>
%
% A more complex script can be studied as well to better understand the algorithms:
%
% *<matlab:edit('spk_factorbox') spk_factorbox>*
% This script generates the factor box that is part of the manuscript
% supplementary material.
% <spk_factorbox.html See here the script output.>
           
