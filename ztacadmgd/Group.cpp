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
#include "Group.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Group::Group () 
	: Autodesk::AutoCAD::DatabaseServices::DBObject ((System::IntPtr)new AcDbGroup (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Group::Group (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: Autodesk::AutoCAD::DatabaseServices::DBObject (unmanagedPointer, bAutoDelete)
{
}

String^ ztAcadMgd::DatabaseServices::Group::Name::get()
{
	return CIFToString(GetImpObj()->name());
}

void ztAcadMgd::DatabaseServices::Group::Name::set(String^ value)
{
	int r = GetImpObj()->setName(StringToCIF(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}