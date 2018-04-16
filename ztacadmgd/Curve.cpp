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
//

//-----------------------------------------------------------------------------
#include "StdAfx.h"
#include "Curve.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
//ztAcadMgd::DatabaseServices::Curve::Curve () 
//	: Autodesk::AutoCAD::DatabaseServices::Entity ((System::IntPtr)new AcDbCurve (), true)
//{
//}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Curve::Curve (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: Autodesk::AutoCAD::DatabaseServices::Entity (unmanagedPointer, bAutoDelete)
{
}

//Point3d ztAcadMgd::DatabaseServices::Curve::GetClosestPointTo(Point3d givenPoint, bool extend)
//{
//	Point3d point = 
//	GetImpObj()->getClosestPointTo(GETPOINT3D(givenPoint), &pointd, extend);
//}

//Point3d ztAcadMgd::DatabaseServices::Curve::GetClosestPointTo(Point3d givenPoint, Vector3d direction, bool extend)
//{
//}

double ztAcadMgd::DatabaseServices::Curve::GetDistanceAtParameter(double value)
{
	double dist;
	int r = GetImpObj()->getDistAtParam(value, dist);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return dist;
}

double ztAcadMgd::DatabaseServices::Curve::GetDistAtPoint(Point3d point)
{
	double dist;
	int r = GetImpObj()->getDistAtPoint(GETPOINT3D(point), dist);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return dist;
}

Vector3d ztAcadMgd::DatabaseServices::Curve::GetFirstDerivative(Point3d point)
{
	AcGeVector3d v;
	int r = GetImpObj()->getFirstDeriv(GETPOINT3D(point), v);\
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToVector3d(v);
}

Vector3d ztAcadMgd::DatabaseServices::Curve::GetFirstDerivative(double value)
{
	AcGeVector3d v;
	int r = GetImpObj()->getFirstDeriv(value, v);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToVector3d(v);
}

//DBObjectCollection ztAcadMgd::DatabaseServices::Curve::GetOffsetCurves(double offsetDist)
//{
//
//}
//
//DBObjectCollection ztAcadMgd::DatabaseServices::Curve::GetOffsetCurvesGivenPlaneNormal(Vector3d normal, double offsetDist)
//{
//
//}

//Curve ztAcadMgd::DatabaseServices::Curve::GetOrthoProjectedCurve(Plane planeToProjectOn)
//{
//}

double ztAcadMgd::DatabaseServices::Curve::GetParameterAtDistance(double dist)
{
	double param;
	int r = GetImpObj()->getParamAtDist(dist, param);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return param;
}

double ztAcadMgd::DatabaseServices::Curve::GetParameterAtPoint(Point3d point)
{
	double param;
	int r = GetImpObj()->getParamAtPoint(GETPOINT3D(point), param);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return param;
}

Point3d ztAcadMgd::DatabaseServices::Curve::GetPointAtDist(double value)
{
	AcGePoint3d point;
	int r = GetImpObj()->getPointAtDist(value, point);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToPoint3d(point);
}

Point3d ztAcadMgd::DatabaseServices::Curve::GetPointAtParameter(double value)
{
	AcGePoint3d point;
	int r = GetImpObj()->getPointAtParam(value, point);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToPoint3d(point);
}

Vector3d ztAcadMgd::DatabaseServices::Curve::GetSecondDerivative(double value)
{
	AcGeVector3d v;
	int r = GetImpObj()->getSecondDeriv(value, v);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToVector3d(v);
}

double ztAcadMgd::DatabaseServices::Curve::Area::get()
{
	double area;
	int r = GetImpObj()->getArea(area);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return area;
}

bool ztAcadMgd::DatabaseServices::Curve::Closed::get()
{
	return GetImpObj()->isClosed();
}

double ztAcadMgd::DatabaseServices::Curve::EndParam::get()
{
	double param;
	int r = GetImpObj()->getEndParam(param);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return param;
}

Point3d ztAcadMgd::DatabaseServices::Curve::EndPoint::get()
{
	AcGePoint3d point;
	int r = GetImpObj()->getEndPoint(point);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToPoint3d(point);
}

void ztAcadMgd::DatabaseServices::Curve::EndPoint::set(Point3d value)
{
	throw gcnew NotImplementedException();
}

bool ztAcadMgd::DatabaseServices::Curve::IsPeriodic::get()
{
	return GetImpObj()->isPeriodic();
}

double ztAcadMgd::DatabaseServices::Curve::StartParam::get()
{
	double param;
	int r = GetImpObj()->getStartParam(param);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return param;
}

Point3d ztAcadMgd::DatabaseServices::Curve::StartPoint::get()
{
	AcGePoint3d point;
	int r = GetImpObj()->getStartPoint(point);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
	return ToPoint3d(point);
}

void ztAcadMgd::DatabaseServices::Curve::StartPoint::set(Point3d value)
{
	throw gcnew NotImplementedException();
}