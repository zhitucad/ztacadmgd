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
#include "Arc.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Arc::Arc () 
	: ztAcadMgd::DatabaseServices::Curve ((System::IntPtr)new AcDbArc (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Arc::Arc (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: ztAcadMgd::DatabaseServices::Curve (unmanagedPointer, bAutoDelete)
{
}

ztAcadMgd::DatabaseServices::Arc::Arc(Point3d center, double radius, double startAngle, double endAngle)
	: Curve((IntPtr)new AcDbArc(GETPOINT3D(center), radius, startAngle, endAngle), true)
{

}

ztAcadMgd::DatabaseServices::Arc::Arc(Point3d center, Vector3d normal, double radius, double startAngle, double endAngle)
	: Curve((IntPtr)new AcDbArc(GETPOINT3D(center), GETVECTOR3D(normal), radius, startAngle, endAngle), true)
{

}

Point3d ztAcadMgd::DatabaseServices::Arc::Center::get()
{
	return ToPoint3d(GetImpObj()->center());
}

void ztAcadMgd::DatabaseServices::Arc::Center::set(Point3d value)
{
	int r = GetImpObj()->setCenter(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::Arc::EndAngle::get()
{
	return GetImpObj()->endAngle();
}

void ztAcadMgd::DatabaseServices::Arc::EndAngle::set(double value)
{
	int r = GetImpObj()->setEndAngle(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::Arc::Radius::get()
{
	return GetImpObj()->radius();
}

void ztAcadMgd::DatabaseServices::Arc::Radius::set(double value)
{
	int r = GetImpObj()->setRadius(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::Arc::StartAngle::get()
{
	return GetImpObj()->startAngle();
}

void ztAcadMgd::DatabaseServices::Arc::StartAngle::set(double value)
{
	int r = GetImpObj()->setStartAngle(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}