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
#include "MText.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::MText::MText () 
	: Autodesk::AutoCAD::DatabaseServices::Entity ((System::IntPtr)new AcDbMText (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::MText::MText (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: Autodesk::AutoCAD::DatabaseServices::Entity (unmanagedPointer, bAutoDelete)
{
}

double ztAcadMgd::DatabaseServices::MText::ActualHeight::get()
{
	return GetImpObj()->actualHeight();
}

double ztAcadMgd::DatabaseServices::MText::ActualWidth::get()
{
	return GetImpObj()->actualWidth();
}

String^ ztAcadMgd::DatabaseServices::MText::AlignChange::get()
{
	return CIFToString(AcDbMText::alignChange());
}

double ztAcadMgd::DatabaseServices::MText::Ascent::get()
{
	return GetImpObj()->ascent();
}

String^ ztAcadMgd::DatabaseServices::MText::BlockEnd::get()
{
	return CIFToString(AcDbMText::blockEnd());
}

String^ ztAcadMgd::DatabaseServices::MText::ColorChange::get()
{
	return CIFToString(AcDbMText::colorChange());
}

String^ ztAcadMgd::DatabaseServices::MText::Contents::get()
{
	return CIFToString(GetImpObj()->contents());
}

void ztAcadMgd::DatabaseServices::MText::Contents::set(String^ value)
{
	int r = GetImpObj()->setContents(StringToCIF(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

Point3d ztAcadMgd::DatabaseServices::MText::Location::get()
{
	return ToPoint3d(GetImpObj()->location());
}

void ztAcadMgd::DatabaseServices::MText::Location::set(Point3d value)
{
	int r = GetImpObj()->setLocation(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

Vector3d ztAcadMgd::DatabaseServices::MText::Normal::get()
{
	return ToVector3d(GetImpObj()->normal());
}

void ztAcadMgd::DatabaseServices::MText::Normal::set(Vector3d value)
{
	int r = GetImpObj()->setNormal(GETVECTOR3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::MText::Rotation::get()
{
	return GetImpObj()->rotation();
}

void ztAcadMgd::DatabaseServices::MText::Rotation::set(double value)
{
	int r = GetImpObj()->setRotation(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::MText::TextHeight::get()
{
	return GetImpObj()->textHeight();
}

void ztAcadMgd::DatabaseServices::MText::TextHeight::set(double value)
{
	int r = GetImpObj()->setTextHeight(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

ObjectId^ ztAcadMgd::DatabaseServices::MText::TextStyle::get()
{
	return ToObjectId(GetImpObj()->textStyle());
}

void ztAcadMgd::DatabaseServices::MText::TextStyle::set(Autodesk::AutoCAD::DatabaseServices::ObjectId^ value)
{
	int r = GetImpObj()->setTextStyle(GETOBJECTID(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::MText::Width::get()
{
	return GetImpObj()->width();
}

void ztAcadMgd::DatabaseServices::MText::Width::set(double value)
{
	int r = GetImpObj()->setWidth(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}