// (C) Copyright 2005-2007 by Autodesk, Inc. 
//
// Permission to use, copy, modify, and distribute this software in
// object code form for any purpose and without fee is hereby granted, 
// provided that the above copyright notice appears in all copies and 
// that both that copyright notice and the limited warranty and
// restricted rights notice below appear in all supporting 
// documentation.
//
// AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS. 
// AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
// MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC. 
// DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
// UNINTERRUPTED OR ERROR FREE.
//
// Use, duplication, or disclosure by the U.S. Government is subject to 
// restrictions set forth in FAR 52.227-19 (Commercial Computer
// Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
// (Rights in Technical Data and Computer Software), as applicable.

//-----------------------------------------------------------------------------
//- Curve.h
#pragma once
//#include "Entity.h"

//-----------------------------------------------------------------------------
using namespace System ;
using namespace Autodesk::AutoCAD::Geometry ;
using namespace Autodesk::AutoCAD::DatabaseServices ;

//-----------------------------------------------------------------------------
//- Wizard Generated Custom Object .NET Wrapper
//- See the mgPoly in the ObjectARX SDK for further information
//-----------------------------------------------------------------------------
namespace ztAcadMgd {
	namespace DatabaseServices {

		/// <summary>  
		/// ÇúÏß
		/// </summary> 
		[Autodesk::AutoCAD::Runtime::Wrapper("AcDbCurve")]
		public ref class Curve : public Autodesk::AutoCAD::DatabaseServices::Entity {

		public:
			//- Constructor
			//Curve () ;

		internal:
			Curve (System::IntPtr unmanagedPointer, bool bAutoDelete) ;

			//- Returns the unmanaged ARX Object
			inline AcDbCurve *GetImpObj () {
				return (static_cast<AcDbCurve *>(UnmanagedObject.ToPointer ())) ;
			}

		public:
			//- To define properties which get/set values of your object
			//- the format you must use is
			//-		__property void set_Center(Point2d point);
			//-		__property Point2d get_Center();
			/*Point3d GetClosestPointTo(Point3d givenPoint, bool extend);
			Point3d GetClosestPointTo(Point3d givenPoint, Vector3d direction, bool extend);*/
			double GetDistanceAtParameter(double value);
			double GetDistAtPoint(Point3d point);
			Vector3d GetFirstDerivative(Point3d point);
			Vector3d GetFirstDerivative(double value);
			/*DBObjectCollection GetOffsetCurves(double offsetDist);
			DBObjectCollection GetOffsetCurvesGivenPlaneNormal(Vector3d normal, double offsetDist);
			Curve GetOrthoProjectedCurve(Plane planeToProjectOn);*/
			double GetParameterAtDistance(double dist);
			double GetParameterAtPoint(Point3d point);
			Point3d GetPointAtDist(double value);
			Point3d GetPointAtParameter(double value);
			Vector3d GetSecondDerivative(double value);
			property double Area
			{
				double get();
			}
			property bool Closed
			{
				bool get();
			}
			property double EndParam
			{
				double get();
			}
			property virtual Point3d EndPoint
			{
				Point3d get();
				void set(Point3d value);
			}
			property bool IsPeriodic
			{
				bool get();
			}
			property double StartParam
			{
				double get();
			}
			property virtual Point3d StartPoint
			{
				Point3d get();
				void set(Point3d value);
			}
		} ;

	}
}