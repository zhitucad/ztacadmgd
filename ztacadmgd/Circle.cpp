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
#include "Circle.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Circle::Circle () 
	: ztAcadMgd::DatabaseServices::Curve ((System::IntPtr)new AcDbCircle (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Circle::Circle (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: ztAcadMgd::DatabaseServices::Curve (unmanagedPointer, bAutoDelete)
{
}

ztAcadMgd::DatabaseServices::Circle::Circle(Point3d center, Vector3d normal, double radius)
	: Curve((IntPtr)new AcDbCircle(GETPOINT3D(center), GETVECTOR3D(normal), radius), true)
{

}

Point3d ztAcadMgd::DatabaseServices::Circle::Center::get()
{
	return ToPoint3d(GetImpObj()->center());
}

void ztAcadMgd::DatabaseServices::Circle::Center::set(Point3d value)
{
	int r = GetImpObj()->setCenter(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::Circle::Radius::get()
{
	return GetImpObj()->radius();
}

void ztAcadMgd::DatabaseServices::Circle::Radius::set(double value)
{
	int r = GetImpObj()->setRadius(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}