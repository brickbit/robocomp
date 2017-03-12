
#ifndef ROBOCOMPTRAJECTORYROBOT2D_ICE
#define ROBOCOMPTRAJECTORYROBOT2D_ICE
module RoboCompTrajectoryRobot2D
{
	exception RoboCompException{
            string text;
        };
	
	["cpp:comparable"]
	struct TargetPose
	{
		 float x;
		 float y;
		 float z;
		 float rx;
		 float ry;
		 float rz;
		 bool doRotation;
	};

	["cpp:comparable"]
	struct NavState
	{
		 long elapsedTime;
		 string state;
		 long estimatedTime;
		 long planningTime;
		 float x;
		 float z;
		 float ang;
		 float advV;
		 float rotV;
		 float distanceToTarget;
		 string description;
	};
	dictionary <string, string> NavigationParameterMap;

	["cpp:comparable"]
	struct PointL
	{
		 float x;
		 float z;
	};
	sequence <PointL> PolyLine;
	sequence <PolyLine> PolyLineList;
	interface TrajectoryRobot2D
	{
		float go (TargetPose target) throws RoboCompException;
		void setHumanSpace (PolyLineList polyList);
		float goReferenced (TargetPose target, float xRef, float zRef, float threshold) throws RoboCompException;
		float goBackwards (TargetPose target) throws RoboCompException;
		float changeTarget (TargetPose target) throws RoboCompException;
		NavState getState ();
		void stop ();
		void mapBasedTarget (NavigationParameterMap parameters);
	};
};

#endif
