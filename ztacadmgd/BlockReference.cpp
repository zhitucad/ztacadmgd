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
#include "BlockReference.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::BlockReference::BlockReference () 
	: Autodesk::AutoCAD::DatabaseServices::Entity ((System::IntPtr)new AcDbBlockReference (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::BlockReference::BlockReference (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: Autodesk::AutoCAD::DatabaseServices::Entity (unmanagedPointer, bAutoDelete)
{
}

ztAcadMgd::DatabaseServices::BlockReference::BlockReference (Point3d position, Autodesk::AutoCAD::DatabaseServices::ObjectId^ blockTableRecord)
	: Autodesk::AutoCAD::DatabaseServices::Entity ((IntPtr)new AcDbBlockReference(GETPOINT3D(position), GETOBJECTID(blockTableRecord)), true)
{
}

Vector3d ztAcadMgd::DatabaseServices::BlockReference::Normal::get()
{
	return ToVector3d(GetImpObj()->normal());
}

void ztAcadMgd::DatabaseServices::BlockReference::Normal::set(Vector3d value)
{
	int r = GetImpObj()->setNormal(GETVECTOR3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

Point3d ztAcadMgd::DatabaseServices::BlockReference::Position::get()
{
	return ToPoint3d(GetImpObj()->position());
}

void ztAcadMgd::DatabaseServices::BlockReference::Position::set(Point3d value)
{
	int r = GetImpObj()->setPosition(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::BlockReference::Rotation::get()
{
	return GetImpObj()->rotation();
}

void ztAcadMgd::DatabaseServices::BlockReference::Rotation::set(double value)
{
	int r = GetImpObj()->setRotation(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}