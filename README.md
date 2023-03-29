# 355HeartModel
BME 355 Assignment 3: Cardiovascular System Modelling
Due 11:59 PM, March 24th, 2023

This assignment must be completed individually. No collaboration is allowed. However,
discussion of general approaches with classmates, the TAs, and the instructor is encouraged.
Submit a single PDF document (not a Word document) that includes your answers, including the
codes you completed. Also, submit your MATLAB code in a zip file. You must use the partially
completed code on Learn.

This assignment is based on a model from Ferreira, A., Chen, S., Simaan, M. A., Boston, J. R., &
Antaki, J. F. (2005). A nonlinear state-space model of a combined cardiovascular system and a
rotary pump. Proceedings of the 44th IEEE Conference on Decision and Control, and the
European Control Conference, CDC-ECC ’05, 2005, 897–902.

1) (You DON’T need to answer this question but you will need it for this assignment) Derive
the state-space questions governing the equivalent electrical circuit of the cardiovascular
system discussed in class for the ejection and filling phases (this would be similar to the
isovolumetric phase that we analyzed in class).

2) Complete the unfinished sections of the given code, named “Circulation,” based on the Ferreira
et al. paper and the lecture slides. In particular, complete the nested functions identified as
TASK 1 (~line 100) and TASK 2 (~line 60).

3) Simulate the model for five seconds. To accomplish this, complete the TASK 3 (~ line
154) in the given code named “Circulation” (note that the “simulation” method in TASK
3 will be called in the “MainFile_SeeMe”). For initial conditions, consider all the
blood in the atrium (= “non_slack_blood_volume/C2”). After completing TASK 3
(at this point, the class “Circulation” must be complete), complete TASK 4 in
the given code named “MainFile_SeeMe” to plot the atrial pressure, ventricular
pressure, arterial pressure, and the aortic pressure just outside the aortic valve all in one
figure ( no subplot). Your plot must have the correct label axis and legend which is already
implemented for you. For the aortic pressure just outside the aortic valve ( i.e., between D2
and R4), you can think of this as an output for which you may need to make additional
algebraic calculations.

4) Perform and document suitable verification and validation activities for the model developed
in Q2/3; write your answers clearly (you can add related graphs too) and no longer than 3/4
sentences for each activity. This part of the assignment is entirely open-ended, and there is no
specific correct answer. You should spend ~2 hours on this question.
